<?php if (!isset($redirect)) { ?>

<div class="table-responsive order-boxstyle">
  <table class="table table-hover">
    <thead>
      <tr>
        <td class="text-left"><?php echo $column_name; ?></td>
        <td class="text-center"><?php echo $column_quantity; ?></td>
        <td class="text-center"><?php echo $column_price; ?></td>
        <td class="text-center"><?php echo $column_total; ?></td>
      </tr>
    </thead>
    <tbody>
      <?php foreach ($products as $product) { ?>
      <tr>
        <td class="text-center"><p><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
          <?php foreach ($product['option'] as $option) { ?>
          <br />
          &nbsp;<span> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></span>
          <?php } ?>
          <?php if($product['recurring']) { ?>
          <br />
          <span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
          <?php } ?></p></td>
        <td class="text-center"><span class="price" style="margin:0px;"><?php echo $product['quantity']; ?></span></td>
        <td class="text-center"><span class="price" style="margin:0px;"><?php echo $product['price']; ?></span></td>
        <td class="text-center"><span class="price" style="margin:0px;"><?php echo $product['total']; ?></span></td>
      </tr>
      <?php } ?>
      <?php foreach ($vouchers as $voucher) { ?>
      <tr>
        <td class="text-center"><?php echo $voucher['description']; ?></td>
        <td class="text-center"></td>
        <td class="text-centert">1</td>
        <td class="text-center"><?php echo $voucher['amount']; ?></td>
        <td class="text-center"><?php echo $voucher['amount']; ?></td>
      </tr>
      <?php } ?>
    </tbody>
    <tfoot>
      <?php foreach ($totals as $total) { ?>
      <tr>
        <td colspan="3" class="text-right"><strong><?php echo $total['title']; ?>:</strong></td>
        <td class="text-center"><?php echo $total['text']; ?></td>
      </tr>
      <?php } ?>
    </tfoot>
  </table>

<?php echo $payment; ?>
</div>
<?php } else { ?>
<script type="text/javascript"><!--
location = '<?php echo $redirect; ?>';
//--></script>
<?php } ?>
