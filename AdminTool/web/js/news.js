var temp = new Array(0, 0, 0);
var object = [];

function clickDelete(i) {
	// The object was retrieved successfully.
	object[i].destroy();
	alert('success');
	window.location.reload();
}

function handleNews() {
	AV.initialize("x3x1u303wwaflo331wssrr35fhsfzg4xjcirtf8yv7fxq38y",
			"ibo46nu2zi37f0irbb85gftol2zk09dtlx5sejsm1j7k5tpi");
	var News = AV.Object.extend("News");
	var query = new AV.Query(News);
	query.find({
			success : function(results) {
				var t = document.createElement('table');

				for ( var i = 0; i < results.length; i++) {
					object[i] = results[i];
					temp[0] = object[i].get('content');
					temp[1] = object[i].get('contributor');
					temp[2] = object[i].get('title');

					var buttonDelete = "<input type='button' onClick='clickDelete(" + i + ")' value='删除' />";

					var r = t.insertRow();
					var c1 = r.insertCell();
					c1.innerHTML = buttonDelete;

					for ( var j = 0; j < 3; j++) {
						var c = r.insertCell();
						c.innerHTML = temp[j];
					};
				}

				var r = t.insertRow();
				var c1 = r.insertCell();
				c1.innerHTML = "删除";
				var c2 = r.insertCell();
				c2.innerHTML = "content";
				var c3 = r.insertCell();
				c3.innerHTML = "contributor";
				var c4 = r.insertCell();
				c4.innerHTML = "title";

				document.getElementById('tableNews').appendChild(t);
				t.setAttribute('border', '1');
				t.align='center';
				t.rows[0].align='center';
				t.rows[0].style.fontWeight="bold";
			},
			error : function(error) {
				alert("Error: " + error.code + " " + error.message);
			}
		});
}