<!--<?php include('includes/db.php'); ?>	 

<?php
	$id = $_GET['id'];
	$query = mysql_query("select * from tbl_destination where ad_id='$id'");
	$query2 = mysql_fetch_array($query);
	$image = $query2['ad_image'];
	$image2 = '/adlisting/uploads/'.$image;
	unlink($_SERVER['DOCUMENT_ROOT'].$image2);
	
	$query = mysql_query("delete from tbl_destination where ad_id='$id'");
	if($query){
		echo "<script>window.location='index.php?page=ads&msg=success'</script>";
		}
	else
		echo "<script>window.location='index.php?page=ads'</script>";
?>-->