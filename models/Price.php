<?php
class Price {
    private $dbh;

    public function __construct() {
        include './config/db.php';

        try {
            $this->dbh = new PDO("mysql:host={$params['host']};dbname={$params['name']};charset=utf8;",$params['user'],$params['pass']);
        } catch (PDOException $ex) {
            echo $ex->getMessage();
        }
    }

    public function getProduct() {
      $sql = "SELECT pro.title, pro.description, dpb.doc_id, dp.datetime AS `date`, CASE WHEN dp.status <> '0' THEN dpb.price ELSE NULL END AS price
              FROM product pro
              JOIN (SELECT t1.* FROM doc_price_body t1,
              (SELECT product_id, MAX(doc_id) doc_id FROM doc_price_body GROUP BY product_id) t2
              WHERE t1.product_id=t2.product_id AND t1.doc_id=t2.doc_id) AS dpb ON dpb.product_id=pro.id
              JOIN doc_price dp ON dp.id=dpb.doc_id
              WHERE pro.status<>'1' AND dp.datetime <= '2018-09-14 23:59:59'";
      $result = $this->dbh->query($sql);
      return $result->fetchAll(PDO::FETCH_ASSOC);
    }
}
