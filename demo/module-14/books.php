<?php
  $id = abs((int)$_GET['id']);
	$books = file('books.txt');
	if($id){
		if(isset($books[$id-1]))
			echo $books[$id-1];
		else
			echo 'Такой книги нет';
	}else{
		echo 'Всего книг: ' . count($books);
	}
?>
