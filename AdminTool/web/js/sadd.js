var object = [];
var html = "";
function clickAmend(i) {
    object[i].set('applicationID',document.getElementById('paper1').value);
    object[i].set('clientKey',document.getElementById('paper2').value);
	object[i].save();
	alert('success');
	window.location.reload();
}
var textPaper = new Array(0,0);
textPaper[0] = "<input id='paper1' type='text' value='' />";
textPaper[1] = "<input id='paper2' type='text' value='' />";

function handleSAdd() {
	AV.initialize("x3x1u303wwaflo331wssrr35fhsfzg4xjcirtf8yv7fxq38y",
	"ibo46nu2zi37f0irbb85gftol2zk09dtlx5sejsm1j7k5tpi");
    var SAdd = AV.Object.extend("SAdd");
    var query = new AV.Query(SAdd);
	query.find({
		success : function(results) {
		    html += "<h1>SAdd Table</h1>" + "<p id='return'><a href='jsp/index.jsp' target='_self'>Return</a></p>" + 
		            "<table border='1' style='margin:auto'>" + "<th>" + 'applicationID' + "</th>" + 
		            "<th>" + 'clientKey' + "</th>" + "<th>" + '修改' + "</th>";

			for ( var i = 0; i < results.length; i++) {
				object[i] = results[i];

				textPaper[0] = "<input id='paper1' type='text' value='" + object[i].get('applicationID') + "' />";
				textPaper[1] = "<input id='paper2' type='text' value='" + object[i].get('clientKey') + "' />";
				
				html += "<tr>";
				for(var j = 0; j < 2; j++){				    
				    html += "<td>" + textPaper[j] + "</td>";
			    }
				
				html += "<td>" + "<input type='button' onClick='clickAmend(" + i + ")' value='修改' />" + "</td>" + "</tr>";
			}

			document.getElementById("content").innerHTML = html;

		},
		error : function(error) {
			alert("Error: " + error.code + " " + error.message);
		}
	});
}