<?php
    //include 'ChromePhp.php';
    $servername = "server-ip";
    $username = "username";
    $password = "password";
    $dbname = "database-name";

    $mysqli = new mysqli($servername, $username, $password, $dbname);
    if ($mysqli->connect_errno)
    {
        echo "Error: Failed to make a MySQL connection, here is why: \n";
        echo "Errno: " . $mysqli->connect_errno . "\n";
        echo "Error: " . $mysqli->connect_error . "\n";
        exit;
    }

    if( $_POST["client"] == 'processing' )
    {
        $venueName = $_POST["name"];

        $sql = 'SELECT count FROM venue WHERE name = "'.$venueName.'"';
        if (!$result = $mysqli->query($sql))
        {
            echo "Sorry, the website is experiencing problems.";
        }

        $count = $result->fetch_assoc()[count];
        //echo "Count number: " . $count;
        $count++;

        $updateSQL = 'UPDATE venue SET count="'.$count.'" WHERE name="'.$venueName.'"';

        $procSQL = 'SELECT count FROM venue WHERE name = "'.$venueName.'"';
        $procResult = $mysqli->query($procSQL);
        $procCount = "Total Amount of Click: " . $procResult->fetch_assoc()[count];
        echo $procCount;

        if (!$result = $mysqli->query($updateSQL))
        {
            echo "Sorry, the website is experiencing problems.";
        }
    } else {
        //$test = 'Atak';
        //$atak = 'SELECT count FROM venue WHERE name = "Atak"';
        $getData = 'SELECT * FROM venue';
        if (!$result = $mysqli->query($getData))
        {
            echo "Sorry, the website is experiencing problems.";
        }

        if(is_ajax()){

            while($count = $result->fetch_assoc()){
                //$return["name"] = $count[name];
                //$return["count"] = $count[count];
                $return[] = $count;


            }
                echo json_encode($return);
        }

       // $count = $result->fetch_assoc()[count];
       //echo "Other count: ".$count;
        //echo "<br /> With words $count";        
    }

    $result->free();
    $mysqli->close();

    function is_ajax(){
        return isset($_SERVER['HTTP_X_REQUESTED_WITH']) &&
        strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest';
    }
?>
