<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Keep-Board</title>
</head>

<body>
	<!-- Create a form which will have text boxes for Note title, content and status along with a Add 
		 button. Handle errors like empty fields -->
<div class="form-group form">
		<form action='add' method="post">
			<label>Note Title:</label> <input type="text" id="noteTitle"
				name="noteTitle" placeholder="note title" class="form-control" /> <br />
			<label>Note Content:</label> <input type="text" id="noteContent"
				name="noteContent" placeholder="note content" class="form-control" />
			<br /> <label>Note Status:</label> <select name="noteStatus">
				<option value="activated">Active</option>
				<option value="deactivated">De-active</option>
			</select> <br />
			<button type="submit" class="form-control">Submit</button>
		</form>
	</div>
	<c:if test="${!errorMessage.isEmpty()}">
    		<p>${errorMessage}</p>
    	</c:if>
	<!-- display all existing notes in a tabular structure with Title,Content,Status, Created Date and Action -->

	<h2>All Notes</h2>
	<TABLE BORDER=1>

		<TR>
			<TD><h3>Note Title</h3></TD>
			<TD><h3>Note content</h3></TD>
			<TD><h3>Note Status</h3></TD>
			<TD><h3>Note created at</h3></TD>

		</TR>

		<c:forEach var="note" items="${noteList}">
			<tr>
				<td>${note.getNoteTitle()}</td>
				<td>${note.getNoteContent()}</td>
				<td>${note.getNoteStatus()}</td>
				<td>${note.getCreatedAt()}</td>
				<td><form action='update' method="post">

						<label>NoteTitle:</label>
						<input type="text" id="noteTitle" name="noteTitle"
						placeholder="note title" value="${note.noteTitle}"
						class="form-control" /> <br/>

							<label>Note Content:</label>
							<input	type="text" id="noteContent" name="noteContent"
							placeholder="note content" value="${note.noteContent}"
							class="form-control" /> <br/>

							<label>Note Status:</label>
							<select name="noteStatus">
							<option value="activated">activated</option>
							<option value="deactivated">de-activated</option>
						</select> <br/>

						<button type="submit" class="class="btnbtn-primary">Update</button>
					</form></td>
			</tr>
		</c:forEach>
	</TABLE>
	</body>
</html>
