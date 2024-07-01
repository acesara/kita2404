<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Task List</h1>
    <form method="POST" action="/">
        <input type="hidden" name="csrf_token" value="{{ from.csrf_token._value()}}"/>
        <p> 
            <lavel for="'title">Title:</lavel>
            <input type="text" name="title" id="title" size="32" required />
        </p>
        <p><input type="submit" value="Add Task"/><p>
    </from>
    <ul id="task_list">
        
    </ul>
            
       
</body>
</html>
