pragma solidity 0.5.0;

contract certificates {
	struct user_data {
		string[10] certificate;
		uint certificate_count;
		address[10] sender;
	}
	mapping (address => user_data) public users_mapping;

 function  insert_certificate (string memory _certificate_data, address addrs) public {
       uint count = users_mapping[addrs].certificate_count;
       users_mapping[addrs].certificate[count] = _certificate_data;
       users_mapping[addrs].sender[count] = msg.sender;
        users_mapping[addrs].certificate_count ++;
    }
    
    function get_certificate_self(address addrs) view public returns(string memory) {
        uint count=users_mapping[msg.sender].certificate_count;
        string  memory data;
        bool val = false;
        for (uint i=0; i<=count;i++) {
            address _address= users_mapping[msg.sender].sender[i];
            if (_address== addrs){
                data=users_mapping[msg.sender].certificate[i];
                val=true;
                break;
            }
            
        }
        if(val== false){return "No certificate found";}
        return data;
    }
    
    function get_count(address addrs) view public returns (uint) {
       uint count=users_mapping[addrs].certificate_count;
       uint index = --count;
       return index;
    }
    
    function index_certificate(address addrs, uint index) view public returns(string memory){
        string memory data = users_mapping[addrs].certificate[index];
        return data;
    }
    
}