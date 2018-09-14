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
      $sql = "select pro.title, pro.description, dpb.doc_id, dp.datetime as `date`, CASE WHEN dp.status <> '0' THEN dpb.price ELSE NULL END as price from
              (SELECT t1.* FROM doc_price_body t1,
              (SELECT product_id, MAX(doc_id) doc_id FROM doc_price_body GROUP BY product_id) t2
              WHERE t1.product_id=t2.product_id AND t1.doc_id=t2.doc_id) as dpb
              join product pro on dpb.product_id=pro.id
              join doc_price dp on dp.id=dpb.doc_id
              where pro.status<>'1' and dp.datetime between '2018-09-12 00:00:00' and '2018-09-12 23:59:59'";
      $result = $this->dbh->query($sql);
      return $result->fetchAll(PDO::FETCH_ASSOC);
    }
}
