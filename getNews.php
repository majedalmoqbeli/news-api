<?PHP

/**
 * start config
 */

$con = mysqli_connect("localhost", "root", "", "news_db");
mysqli_set_charset($con, 'utf8mb4');
header("Content-Type:application/json;charset=utf-8");

/**
 * end config
 */


if ($_POST != null) {
    if (isset($_POST['last_id'])
        && is_numeric($_POST['last_id'])
    ) {

        if ($_POST['last_id'] == '0') {
            $sql = "Call get_news()";
        } else {
            $sql = "Call get_news_by_last_id('$_POST[last_id]')";
        }


        $data['news'] = array();
        if ($news_data = mysqli_query($con, $sql)) {
            while ($row = mysqli_fetch_assoc($news_data)) {
                array_push($data['news'], $row);
            }
            $data['status_code'] = 200;
            $data['status_message'] = 'Success';
            echo json_encode($data);

        } else {
            $data['status_code'] = 204;
            $data['status_message'] = 'Failed to get data.';
            echo json_encode($data);

        }
    } else {
        $data['status_code'] = 403;
        $data['status_message'] = 'Forbidden. You don\'t have permission to access to the server !!';
        echo json_encode($data);
    }

} else {
    $data['status_code'] = 406;
    $data['status_message'] = 'Not Acceptable';
    echo json_encode($data);
}

// closing connection
mysqli_close($con);

