module.exports = function (options) {
    //Import the mock data json file
    const mockData = require('./MOCK_DATA.json');

    //To DO: Add the patterns and their corresponding functions
    this.add('role:productDescp,cmd:productUrl', getProductUrl);
    this.add('role:productDescp,cmd:productName', getProductName);


    //To DO: add the pattern functions and describe the logic inside the function
    function getProductUrl(msg, respond) {
        if(msg.productId){
        	for(var i=0; i<mockData.length; i++){
        		if(mockData[i].product_id == msg.productId){
        			var res = mockData[i].product_url;
            		respond(null, { result: res });
        		}
        	}
        }
        else {
            respond(null, { result: ''});
        }
    }

    function getProductName(msg, respond) {
        if(msg.productId){
            for(var i=0; i<mockData.length; i++){
        		if(mockData[i].product_id == msg.productId){
        			var res = mockData[i].product_name;
            		respond(null, { result: res });
        		}
        	}
        }
        else {
            respond(null, { result: ''});
        }
    }

}