<?php

class Product extends Model{
    private $product_id, $title, $brand, $image, $min_price, $max_price;
    private $variants;   

    public function __construct($details){
        parent::__construct();
        foreach($details as $key => $val){
            $this->$key = $val;            
        }
    }

    public static function top_selling_products(){
        $products = [];
        $db = DB::getInstance();
        $resultsQ = $db->call_procedure('top_selling_products');
        foreach($resultsQ as $result){
            $products[] = new Product($result);
        }
        return $products;
    }

    public static function get_product_by_id($id){
        $db = DB::getInstance();
        $resultsQ = $db->select('products', '*', ['conditions' => 'product_id = ?', 'bind' => [$id]]);
        // dnd($resultsQ);
        $product = new Product($resultsQ[0]);
        // dnd($product);
        return $product;
    }

    public function set_variant($id){
        parent::set_model_name('Variant');
        parent::set_table_name('variants');
        $variant = parent::select(['variant_id', 'sku', 'weight', 'price', 'stock'], [
            'conditions' => 'variant_id = ?',
            'bind' => [$id]
        ]);
        // dnd($variant);
        $this->variants = $variant; 
    }
    public static function get_mostsales_products($date1,$date2){
        $db=DB::getInstance();
        //call procedure not working....
            $sql="SELECT sum(quantity) as cc from orders INNER JOIN order_details using(order_id) where orders.order_date BETWEEN '".$date1."' and '".$date2."'";
            $numAll=$db->query($sql)->results()[0]->cc;
        // $numAll=$db->call_procedure('get_all_Product_sales_count',[$date1,$date2])[0]->cc;
        
        $products=array();
        $sql="SELECT products.title, sum(order_details.quantity) as cc from orders INNER JOIN order_details using(order_id) INNER JOIN products using(product_id) WHERE orders.order_date BETWEEN '".$date1."' AND '".$date2."'  GROUP BY order_details.product_id ORDER BY  cc DESC limit 10";
        
        // $resultQ=$db->call_procedure('get_most_sales_products',[$date1,$date2]);
        
        $resultQ=$db->query($sql)->results();
        foreach($resultQ as $result){
            $title=$result->title;
            $count=$result->cc;
            $products[$title]=$count;
        }
        return [$products,$numAll];

    }
    public function select_variants(){
        parent::set_model_name('Variant');
        parent::set_table_name('variants');
        $this->variants = parent::select(['variant_id', 'sku', 'weight', 'price', 'stock'], [
            'conditions' => 'product_id = ?',
            'bind' => [$this->product_id]
        ]);   
    }
    public static function get_details_of_product($product_id){
        $details=array();
        $db=DB::getInstance();
        $categoryResult=$db->select('categories join product_category_relations using (category_id)','title',[
            'conditions'=> 'product_id = ? ',
            'bind'=>[$product_id]            
        ]);
        $results=$db->select('variants',['MAX(price) as maxPrice','MIN(price) as minPrice'],[
            'conditions'=> 'product_id = ? ',
            'bind'=>[$product_id]
            ]);
        
        
        $titleRes=$db->select('products',['title','brand'],[
            'conditions'=> 'product_id = ? ',
            'bind'=>[$product_id]
        ]);
        $details["title"]=$titleRes[0]->title;
        $details["maxPrice"]=$results[0]->maxPrice;
        $details["minPrice"]=$results[0]->minPrice;
        $details["brand"]=$titleRes[0]->brand;
        $details["category"]=$categoryResult[0]->title;
        return $details;
    }

    public static function get_products_from_key($key){
        $products=array();
        $db=DB::getInstance();
        $results=$db->select('products','product_id',[
            'conditions'=> ['title like ?'],
            'bind'=>[$key]
            ]);
        $rowcount=$db->get_row_count();
        for($i=0;$i<$rowcount;$i++){
            $product_id=$results[$i]->product_id;
            array_push($products,$product_id);
        }
        return $products;
    }
    
    public static function  get_attributes($product_id){
        $attributes=array();
        $db=DB::getInstance();
        $attriResult=$db->select('attributes',['attribute_name','value'],[
            'conditions'=> ['product_id= ?'],
            'bind'=>[$product_id]
        ]); 
        $rowcount=$db->get_row_count();
        for($i=0;$i<$rowcount;$i++){
            $attribute_name=$attriResult[$i]->attribute_name;
            $value=$attriResult[$i]->value;
            if(array_key_exists($attribute_name, $attributes)==false){
                $attributes[$attribute_name]=array();
                array_push($attributes[$attribute_name],$value);
            }
            else{
                if(in_array($value,$attributes[$attribute_name])==false){
                    array_push($attributes[$attribute_name],$value);
                }
            }
        }
        return $attributes;            
    }
    public static function update_stock($cart_array){
        $db = DB::getInstance();
        foreach($cart_array as $product){
            $new_stock = 'stock - ' . $product['quantity'];
            $db->update('variants', ['stock' => $new_stock], [
                'conditions' => 'variant_id = ?',
                'bind' => [$product['variant_id']]
            ]);
        }
    }

    public function get_belonging_categories(){
        $resultsQ = parent::call_procedure('get_belonging_categories', $this->product_id);
        $category_array = [];

        if($resultsQ != false){
            $count = count($resultsQ);
            for($i = 0; $i < $count; $i++){
                $category_array[$i]['category_id'] = $resultsQ[$i]->category_id;
                $category_array[$i]['title'] = $resultsQ[$i]->title;
            }
            return $category_array;
        }
        else{
            return [];
        }
    }

    public function get_product_id(){
        return $this->product_id;
    }

    public function get_title(){
        return $this->title;
    }

    public function get_brand(){
        return $this->brand;
    }

    public function get_image(){
        return $this->image;
    }

    public function get_min_price(){
        return $this->min_price;
    }

    public function get_max_price(){
        return $this->max_price;
    }

    public function get_variants(){
        return $this->variants;
    }
}