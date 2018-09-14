<html>
    <head>
        <title>IMB</title>
    </head>
    <body>
        <table id="main">
          <tr>
            <th>Наименование</th>
            <th>Описание</th>
            <th>Номер документа</th>
            <th>Дата  документа</th>
            <th>Цена</th>
          </tr>
          <?php foreach ($data as $elem) {?>
              <tr>
                <th><?=$elem['title'] ?></th>
                <th><?=$elem['description'] ?></th>
                <th><?=$elem['doc_id'] ?></th>
                <th><?=$elem['date'] ?></th>
                <th><?=isset($elem['price']) ? $elem['price'] : ''  ?></th>
              </tr>
          <?php } ?>
        </table>
    </body>
</html>
