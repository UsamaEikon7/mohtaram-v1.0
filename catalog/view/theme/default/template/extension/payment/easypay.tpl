<form action="<?php echo $action; ?>" method="post">
	<input type="hidden" name="storeId" value="<?php echo $easypay_storeId; ?>" />
	<input type="hidden" name="amount" value="<?php echo $orderamount; ?>" />
	<input type="hidden" name="postBackURL" value="<?php echo $return_url; ?>" />
	<input type="hidden" name="orderRefNum" value="<?php echo $orderid; ?>" />
	<input type="hidden" name="expiryDate" value="<?php echo $easypay_expiry; ?>" />
	<input type="hidden" name="autoRedirect" value="<?php echo $easypay_auto_redirection; ?>" />
	<input type="hidden" name="emailAddr" value="<?php echo $billemail; ?>" />
	<input type="hidden" name="mobileNum" value="<?php echo $billphone; ?>" />
	<input type="hidden" name="merchantHashedReq" value="<?php echo $easypay_hashKey; ?>" />
	<input type="hidden" name="paymentMethod" value="<?php echo $easypay_payment_method; ?>" />
	<input type="hidden" name="return_url" value="<?php echo $return_url; ?>" />
	<div class="buttons">
		<div class="pull-right">
		  <input type="submit" class="btn btn-primary" value="<?php echo $button_confirm; ?>"/>
		</div>
	</div>
</form>