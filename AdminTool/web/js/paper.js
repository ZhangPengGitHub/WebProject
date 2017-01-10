var object = 0;

var textPaper = new Array(0,0,0,0,0,0);
textPaper[0] = "<input id='paper1' type='text' value='' />";
textPaper[1] = "<input id='paper2' type='text' value='' />";
textPaper[2] = "<input id='paper3' type='text' value='' />";
textPaper[3] = "<input id='paper4' type='text' value='' />";
textPaper[4] = "<input id='paper5' type='text' value='' />";
textPaper[5] = "<input id='paper6' type='text' value='' />";

function clickInsert() {

    object.set('contributor',document.getElementById('paper1').value);
    object.set('author',document.getElementById('paper2').value);
    object.set('title',document.getElementById('paper3').value);
    object.set('abstract',document.getElementById('paper4').value);
    object.set('jcname',document.getElementById('paper5').value);
    object.set('year',document.getElementById('paper6').value);
	object.save();
	alert('success');
	window.location.reload();
}

function handlePaper() {
	AV.initialize("x3x1u303wwaflo331wssrr35fhsfzg4xjcirtf8yv7fxq38y",
	"ibo46nu2zi37f0irbb85gftol2zk09dtlx5sejsm1j7k5tpi");
    var Paper = AV.Object.extend("Paper");
    object = new Paper();
    
	document.write ("<table border='1' style='margin:auto'>");

	document.write ("<th>");
    document.write ('contributor');
    document.write ("</th>");
    document.write ("<th>");
    document.write ('author');
    document.write ("</th>");
    document.write ("<th>");
    document.write ('title');
    document.write ("</th>");
    document.write ("<th>");
    document.write ('abstract');
    document.write ("</th>");
    document.write ("<th>");
    document.write ('jcname');
    document.write ("</th>");
    document.write ("<th>");
    document.write ('year');
    document.write ("</th>");
    document.write ("<th>");
    document.write ('添加');
    document.write ("</th>");
    
	document.write ("<tr>");
	for(var j = 0; j < 6; j++){
	    document.write ("<td>");
	    document.write (textPaper[j]);
	    document.write ("</td>");
    }
    document.write ("<td>");
    document.write ("<input type='button' onClick='clickInsert()' value='添加' />");
    document.write ("</td>");
	document.write ("</tr>");
}