App = {
  web3Provider: null,
  contracts: {},
  account: '0x0',
  init: function(){
    return App.initWeb3();
  },
  initWeb3:function () {
    if (typeof web3 != 'undefined') {
      App.web3Provider = web3.currentProvider;
      web3 = new Web3(web3.currentProvider);
    } else {
      App.web3Provider = new Web3.providers.HttpProvider('http://localhost:7545');
      web3 = new Web3(App.web3Provider);
    }
    return App.initContract();
  },
  initContract : function(){
    $.getJSON("certificates.json",function (certificates){
      App.contracts.Certifcate = TruffleContract(certificates);
      App.contracts.Certifcate.setProvider(App.web3Provider);
      api:function();
    });
  },
  api:function(){
    var userinstance;
    web3.eth.getCoinbase(function(err,account){
      if(err === null) {
        App.account = account;
      }
    });
  }
};


$(function() {
  $(window).load(function() {
    App.init();
  });
});
