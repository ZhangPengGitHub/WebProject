var object = [];
var html = "";

function clickAmend(i) {
    object[i].set('help',document.getElementById('paper').value);
	object[i].save();
	alert('success');
	window.location.reload();
}
var textPaper = 0;

function handleHelp() {
	AV.initialize("x3x1u303wwaflo331wssrr35fhsfzg4xjcirtf8yv7fxq38y",
	"ibo46nu2zi37f0irbb85gftol2zk09dtlx5sejsm1j7k5tpi");
    var Help = AV.Object.extend("Help");      
    var query = new AV.Query(Help);
	query.find({
		success : function(results) {

		     html += "<h1>Help Table</h1>" + 
		            "<p id='return'><a href='jsp/index.jsp' target='_self'>Return</a></p>" + 
		            "<table border='1' style='margin:auto'>" + "<th>" + 'help' + "</th>" + "<th>" + '修改' + "</th>";
			for ( var i = 0; i < results.length; i++) {
				object[i] = results[i];

				textPaper = "<input id='paper' type='text' value='" + object[i].get('help') + "' />";
				
				html += "<tr>" + "<td>" + textPaper + "</td>" + 
				"<td>" + "<input type='button' onClick='clickAmend(" + i + ")' value='修改' />" + "</td>" + "</tr>";
			}
			
			document.getElementById("content").innerHTML = html;

		},
		error : function(error) {
			alert("Error: " + error.code + " " + error.message);
		}
	});
}