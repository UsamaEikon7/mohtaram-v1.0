<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

ERROR - 2016-12-19 13:48:53 --> Email could not been sent. Mailer Error (Line 137): Could not instantiate mail function.
ERROR - 2016-12-19 13:48:53 --> #0 D:\wamp64\www\test\appointments\application\controllers\Appointments.php(455): EA\Engine\Notifications\Email->sendAppointmentDetails(Array, Array, Array, Array, Array, Object(EA\Engine\Types\Text), Object(EA\Engine\Types\Text), Object(EA\Engine\Types\Url), Object(EA\Engine\Types\Email))
#1 D:\wamp64\www\test\appointments\system\core\CodeIgniter.php(514): Appointments->ajax_register_appointment()
#2 D:\wamp64\www\test\appointments\index.php(353): require_once('D:\\wamp64\\www\\t...')
#3 {main}
