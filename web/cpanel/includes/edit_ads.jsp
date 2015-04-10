<?php
if(isset($_POST['edit_ads'])){
	$id = $_POST['id'];
	$ad_cat = $_POST['category'];
	$ad_title = $_POST['ad_title'];
	$ad_link = $_POST['ad_link'];
	$ad_desc = $_POST['editor1'];
	$publish = $_POST['publish'];
	$ad_created = date("Y-m-d");
	
	if(!empty($_FILES["image"]["name"])){
	//this delete the previous image
	$query = mysql_query("select * from tbl_product where ad_id='$id'");
	$query2 = mysql_fetch_array($query);
	$image = $query2['ad_image'];
	$image2 = '/adlisting/uploads/'.$image;
	unlink($_SERVER['DOCUMENT_ROOT'].$image2);
	
	$ad_image = $_FILES["image"]["name"];
	$tmp_name = $_FILES["image"]["tmp_name"];
	
	move_uploaded_file($_FILES["image"]["tmp_name"],
      "../uploads/" . $_FILES["image"]["name"]);
	$query3 = mysql_query("update tbl_product set  
	  ad_image = '$ad_image'
	  where ad_id='$id'"); 
	}
	
	$query = mysql_query("update tbl_product set
			ad_cat = '$ad_cat', 
			ad_title = '$ad_title', 
			ad_link = '$ad_link', 
			ad_desc = '$ad_desc', 
			ad_created = '$ad_created', 
			publish = '$publish' 
			where ad_id = '$id'");
	if($query){
		echo "<script>window.location='index.php?page=ads'</script>";
		}
	else{
		echo "<script>window.location='index.php?page=ads'</script>";		}
	}

?>
<?php
if(isset($_GET['id'])){
	$id = $_GET['id'];
	$query = mysql_query("select * from tbl_product where ad_id='$id'");
	$query3 = mysql_fetch_array($query);
	}
?>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<div class="form-elements">
<form name="ads" action="" method="post" enctype="multipart/form-data">
					<h1>UPDATE AN AD</h1>
					<div class="hr"></div>
					<div class="fixed form-elements-inputs">
						<div class="col-240">
							<h4>Select Category</h4>
                            <h4>Destination Title</h4>
                            <h4>Destination Link</h4>
                            <h4>Upload Image</h4>
                            <h4>Publish</h4>
                            <h4>Description</h4>
                            <h4></h4>
						</div>
						<div class="col-400">
							<input type="hidden" name="id" value="<?php echo $query3[0]; ?>" />
                            <select name="category">
                            <?php
								$query1 = mysql_query("select * from tbl_category");
								while($query2 = mysql_fetch_array($query1)){ ?>
                                <option value="<?php echo $query2['cat_name']; ?>"><?php echo $query2['cat_name']; ?></option>
                            <?php } ?>
                            </select>
                            <input type="text" name="ad_title" value="<?php echo $query3['ad_title']; ?>" />
                            <input type="text" name="ad_link" value="<?php echo $query3['ad_link']; ?>" />
                            <input type="file" name="image" value="<?php echo $query3['ad_image']; ?>">
                            <div class="rad-el">YES<input class="rad" type="radio" name="publish" checked="checked" value="1" /></div> <br/>
                            <div class="rad-el">NO<input class="rad" type="radio" name="publish" value="0" /> </div>
							<div style="clear:both"></div>
                            <div class="wysiwyg-editor-wrapper">
                            <textarea  name="editor1" id="sample-textarea" class="ckeditor" rows="20" cols="25" placeholder="Input Goes Here ! ! "> <?php echo $query3['ad_desc']; ?>
								 
							</textarea>
					
							</div>
							<input class="sub button-grey arrow" name="edit_ads" type="submit" value="Submit">
                            <br/> <br/>
                            <img style="padding:10px; border:1px dotted #ddd" src="../uploads/<?php echo $query3['ad_image']; ?>" width="400" /><br/>
                            <p>Current Banner</p>
						</div>
					</div>					
</form>
</div>