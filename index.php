<!DOCTYPE html>
<html>

	<?php
    include 'getGroup.php'
?>
	<head>
		<title>PHP Mothafucka</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.3/jquery.min.js"></script>
        <script>
        $(document).ready(function(){
            var data = {
                "action": "test"
            };

            data = $(this).serialize() +  "&" + $.param(data);

            $.ajax({
                type: "GET",
                dataType: "json",
                url: "getGroup.php",
            }).done( function( data ){
                console.log(data);
                for(i = 0; i < data.length; i++){
                    $('.returned').append(data[i].name + " - " + data[i].count + "<br />");
                }
            });

            return false;
        });

        </script>
	</head>

	<body>
		<h1>PHP Retrieval</h1>

        <div class="returned"></div>
	<script>
		//var obj = echo json_encode($count); ?>;
		//console.log(obj);
	</script>

	</body>
</html>