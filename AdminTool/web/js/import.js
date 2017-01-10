function test() {
	AV.initialize("x3x1u303wwaflo331wssrr35fhsfzg4xjcirtf8yv7fxq38y",
			"ibo46nu2zi37f0irbb85gftol2zk09dtlx5sejsm1j7k5tpi");
	var Paper = AV.Object.extend("Paper");
	var paper = new Paper();

	for (var i = 0; i < res.length; i++) {
		paper = new Paper();
		title = res[i][0];
		author = res[i][1];
		abstract = res[i][2];
		contributor = res[i][3];
		jcname = res[i][4];
		year = res[i][5];
		paper.set("title", title);
		paper.set("author", author);
		paper.set("abstract", abstract);
		paper.set("contributor", contributor);
		paper.set("jcname", jcname);
		paper.set("year", year);
		paper.save(null, {
			success : function(paper) {
				// Execute any logic that should take place after the object is
				// saved.
				// alert('New object created with objectId: ' + paper.id);
			},
			error : function(paper, error) {
				// Execute any logic that should take place if the save fails.
				// error is a AV.Error with an error code and description.
				alert('Failed to create new object, with error code: '
						+ error.description);
			}
		});
	}
}
