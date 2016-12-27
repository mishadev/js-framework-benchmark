var _ = require('lodash');
var exec = require('child_process').execSync;
var fs = require('fs');


var names = [];
_.each(fs.readdirSync('.'), function(name) {
	if(fs.statSync(name).isDirectory() && name[0] !== '.' && name !== 'css' && name !== 'dist'  && name !== 'node_modules' && name !== 'webdriver-java' && name !== "graphical-session") {
		exec('npm run build-prod', {
			cwd: name,
			stdio: 'inherit'
		});
		if (name.indexOf("webdriver") !== 0) names.push(name);
	}
});

fs.writeFile('index.html', `
<!DOCTYPE html>
<html>
   <head>
      <title>JS-Framkeworks Benchmark</title>
      <meta charset="UTF-8">
      <link href="css/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet"/>
      <link rel="stylesheet" href="css/main.css">
      <meta name="viewport" content="width=device-width, initial-scale=1">
   </head>
   <body>
      <div class="container">
         <div class="panel panel-default">
            <div class="panel-heading">
               <h3 class="panel-title">Choose a framework:</h3>
            </div>
            <div class="panel-body">
               <ul class="nav nav-pills nav-stacked">
							${_.map(names, name => `
									<li>
										<a href="${name}">
											<span class="glyphicon glyphicon-arrow-right" aria-hidden="true">
											</span>
											${name}
										</a>
									</li>
							`).join('')}
               </ul>
            </div>
         </div>
         <div class="panel panel-default">
            <div class="panel-body">
               <ul class="nav nav-pills nav-stacked">
                  <li><a href="webdriver-ts/table.html"><span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span> Table Report</a></li>
               </ul>
            </div>
         </div>
      </div>
   </body>
</html>`, 'utf8', (err) => {
  if (err) throw err;
  console.log('It\'s saved!');
});
