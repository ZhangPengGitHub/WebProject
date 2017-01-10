var temp = new Array(0, 0, 0, 0);
var object = [];
var objectNews = 0;
var objectNotice = 0;

function clickDelete(i) {
	// The object was retrieved successfully.
	object[i].destroy();
	alert('success');
	window.location.reload();
}
function clickInsert(i) {
	if(object[i].get('type')=='News'){
		objectNews.set('contributor',object[i].get('contributor'));
		objectNews.set('content',object[i].get('content'));
		objectNews.set('title',object[i].get('title'));
		objectNews.save();
		object[i].destroy();
	}
	if(object[i].get('type')=='Notice'){
		objectNotice.set('contributor',object[i].get('contributor'));
		objectNotice.set('content',object[i].get('content'));
		objectNotice.set('title',object[i].get('title'));
		objectNotice.save();
		object[i].destroy();
	}
	alert('success');
	window.location.reload();
}

function handleInfo() {
	AV.initialize("x3x1u303wwaflo331wssrr35fhsfzg4xjcirtf8yv7fxq38y",
			"ibo46nu2zi37f0irbb85gftol2zk09dtlx5sejsm1j7k5tpi");
	var Info = AV.Object.extend("Info");
	var News = AV.Object.extend("News");
	var Notice = AV.Object.extend("Notice");
	objectNews = new News();
	objectNotice = new Notice();
	
	var query = new AV.Query(Info);
	query.find({
			success : function(results) {
				var t = document.createElement('table');

				for ( var i = 0; i < results.length; i++) {
					object[i] = results[i];
					temp[0] = object[i].get('content');
					temp[1] = object[i].get('contributor');
					temp[2] = object[i].get('title');
					temp[3] = object[i].get('type');

					var buttonDelete = "<input type='button' onClick='clickDelete(" + i + ")' value='删除' />";
					var buttonInsert = "<input type='button' onClick='clickInsert(" + i + ")' value='添加' />";

					var r = t.insertRow();
					var c1 = r.insertCell();
					var c2 = r.insertCell();
					c1.innerHTML = buttonDelete;
					c2.innerHTML = buttonInsert;

					for ( var j = 0; j < 4; j++) {
						var c = r.insertCell();
						c.innerHTML = temp[j];
					};
				}

				var r = t.insertRow();
				var c1 = r.insertCell();
				c1.innerHTML = "删除";
				var c2 = r.insertCell();
				c2.innerHTML = "添加";
				var c3 = r.insertCell();
				c3.innerHTML = "content";
				var c4 = r.insertCell();
				c4.innerHTML = "contributor";
				var c5 = r.insertCell();
				c5.innerHTML = "title";
				var c6 = r.insertCell();
				c6.innerHTML = "type";
				
				document.getElementById('tableInfo').appendChild(t);
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