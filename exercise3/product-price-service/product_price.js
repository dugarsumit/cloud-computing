module.exports = function (options) {
    //Import the mock data json file
    const mockData = require('./MOCK_DATA.json');
    //To DO: Add the patterns and their corresponding functions
    this.add('role:productPrice,cmd:productPrice', getProductPrice);


    //To DO: add the pattern functions and describe the logic inside the function
    function getProductPrice(msg, respond) {
        if(msg.productId){
            for(var i=0; i<mockData.length; i++){
        		if(mockData[i].product_id == msg.productId){
        			var res = mockData[i].product_price;
            		respond(null, { result: res });
        		}
        	}
        }
        else {
            respond(null, { result: ''});
        }
    }

}