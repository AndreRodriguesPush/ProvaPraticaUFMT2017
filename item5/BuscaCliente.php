<?php
try {
    $conn = new PDO('mysql:host=127.0.0.1;db=name=db_item5', 'root', '');
} catch (Exception $e) {
    echo "ERROR:" . $e->getMessage();
}
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="utf-8">

<style>
body {
	margin: 0 auto;
	width: 50%;
}

table {
	border: 1px;
	bordercolor: #000;
}
</style>
</head>

<body>
	<form action="BuscaCliente.php" method="post">
		<label>Nome:<input type="text" name="nome" /></label> <input
			type="submit" name="buscar" value="Buscar" />
	</form>
	<br />

	<table >
		<tr style="background-color: #CCC;">
			<td>Nome</td>
			<td>E-mail</td>
			<td>Data Nasc.</td>
		</tr>
		<?php
            //if (isset($_POST["buscar"])) {
                
               // $nome = $_POST["nome"];
                
               // $SQL = ("SELECT * FROM cliente WHERE nome like '%" . $nome . "%'");
                $SQL = ("SELECT * FROM cliente");
                //echo $SQL;
                $execQuery = $conn->query($SQL);                
                $result = $execQuery->fetch_assoc();
                 
                 //if ($result) {
                    
                foreach ($result as $row) {
                        ?>
            	     <tr>
            			<td><?php //echo $row["nome"]; ?></td>
            			<td><?php //echo $row["email"]; ?></td>
            			<td><?php //echo $row["datanascimento"]; ?></td>
            		</tr>	  
            	       <?php
                   //}
                }
           // }
            ?>             
	</table>


</body>

</html>
