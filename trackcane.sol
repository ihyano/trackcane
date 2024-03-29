pragma solidity ^0.4.6;

contract TrackCane {
    
    uint public _lotnumber;
    uint public _cane;
    uint public _cane_cleaned;
    uint public _broth;
    uint public _broth_clarified;
    uint public _syrup;
    uint public _sugar;
    uint public _honey;
    uint public _wine;
    uint public _anhydrous_alcohol;
    uint public _hydrated_alcohol;
    
    uint public lotCounter=0;
    bytes32 newKey;
    
    function setlotnumber(uint slotnum) public returns(uint) {
        
        _lotnumber = slotnum;
        
        return _lotnumber;
    }

    function setcane(uint ston) public returns(uint) {
        
        _cane = ston;
        
        return _cane;
    }

    function setcane_cleaned(uint ston_cleaned) public returns(uint) {
        
        _cane_cleaned = ston_cleaned;
        
        return _cane_cleaned;
    }

    struct CaneReceived {
        address sender;
        uint lotnumber;
        uint cane;
        uint cane_cleaned;
        uint broth;
        uint broth_clarified;
        uint syrup;
        uint sugar;
        uint honey;
        uint wine;
        uint anhydrous_alcohol;
        uint hydrated_alcohol;
    }

    
    mapping(bytes32 => CaneReceived) public caneReceived;

    
    
    struct caneKeyList {
      bytes32 caneKey;    
    }
    
    mapping(uint => caneKeyList) public lotn;
    
    struct lotList {
        uint lotNumCount;
    }
    
    mapping(uint => lotList) public lotc;

    event LogCaneReceived(address sender, uint lotnumber, uint cane, uint cane_cleaned);

    function Reception () public returns(bool success) {
        if(_lotnumber==0) throw;
        if(_cane==0) throw;
        if(_cane_cleaned==0) throw;
        // make a unique key ... 
        lotCounter = lotCounter + 1;
        newKey = sha3(msg.sender, lotCounter);
        caneReceived[newKey].sender = msg.sender;
        caneReceived[newKey].lotnumber = _lotnumber;
        caneReceived[newKey].cane = _cane;
        caneReceived[newKey].cane_cleaned = _cane_cleaned;
        lotn[_lotnumber].caneKey = newKey;
        lotc[lotCounter].lotNumCount = _lotnumber;
        logCaneReceived(msg.sender, _lotnumber, _cane, _cane_cleaned);
        
        return true;
    }


    event LogBrothExtraction(address sender, uint lotnumber, uint broth);

    function setbroth(uint sbr) public returns(uint) {
        
        _broth = sbr;
        
        return _broth;
    }

    function BrothExtraction() public returns(bool success) {
        if(_lotnumber==0) throw;
        if(_broth==0) throw;
        caneReceived[newKey].broth = _broth;
        caneReceived[newKey].lotnumber = _lotnumber;
        LogBrothExtraction(msg.sender, _lotnumber, _broth);
        
        return true;
        
    }

    event LogBrothClarification(address sender, uint lotnumber, uint brothclarified);

    function setbrothclarified(uint sbrcl) public returns(uint) {
        
        _broth_clarified = sbrcl;
        
        return _broth_clarified;
    }

    function BrothClarification() public returns(bool success) {
        if(_lotnumber==0) throw;
        if(_broth_clarified==0) throw;
        caneReceived[newKey].broth_clarified = _broth_clarified;
        caneReceived[newKey].lotnumber = _lotnumber;
        LogBrothExtraction(msg.sender, _lotnumber, _broth_clarified);
        
        return true;
        
    }

    event LogEvaporation(address sender, uint lotnumber, uint syrup);
    
    function setsyrup(uint ssyr) public returns(uint) {
        
        _syrup = ssyr;
        
        return _syrup;
    }

    function Evaporation() public returns(bool success) {
        if(_lotnumber==0) throw;
        if(_syrup==0) throw;
        caneReceived[newKey].syrup = _syrup;
        caneReceived[newKey].lotnumber = _lotnumber;
        LogEvaporation(msg.sender, _lotnumber, _syrup);
        
        return true;
        
    }

    event LogSugarProduction(address sender, uint lotnumber, uint sugar, uint honey);

    function setsugar(uint ssug) public returns(uint) {
        
        _sugar = ssug;
        
        return _sugar;
    }
    
    function sethoney(uint shny) public returns(uint) {
        
        _honey = shny;
        
        return _honey;
    }


    function SugarProduction() public returns(bool success) {
        if(_lotnumber==0) throw;
        if(_sugar==0) throw;
        if(_honey==0) throw;
        caneReceived[newKey].sugar = _sugar;
        caneReceived[newKey].honey = _honey;
        caneReceived[newKey].lotnumber = _lotnumber;
        LogSugarProduction(msg.sender, _lotnumber, _sugar, _honey);
        
        return true;
        
    }

    event LogFermentation(address sender, uint lotnumber, uint wine);

    function setwine(uint swne) public returns(uint) {
        
        _wine = swne;
        
        return _wine;
    }
    
    
    function Fermentation() public returns(bool success) {
        if(_lotnumber==0) throw;
        if(_wine==0) throw;
        caneReceived[newKey].wine = _wine;
        caneReceived[newKey].lotnumber = _lotnumber;
        LogFermentation(msg.sender, _lotnumber, _wine);
        
        return true;
        
    }

    event LogDistillation(address sender, uint lotnumber, uint anhydrous_alcohol, uint hydrated_alcohol);

    function setanhydrous(uint sanhy) public returns(uint) {
        
        _anhydrous_alcohol = sanhy;
        
        return _anhydrous_alcohol;
    }
    
    function sethydrated(uint shydra) public returns(uint) {
        
        _hydrated_alcohol = shydra;
        
        return _hydrated_alcohol;
    }
    
    
    function Distillation() public returns(bool success) {
        if(_lotnumber==0) throw;
        if(_anhydrous_alcohol==0) throw;
        if(_hydrated_alcohol==0) throw;
        caneReceived[newKey].anhydrous_alcohol = _anhydrous_alcohol;
        caneReceived[newKey].hydrated_alcohol = _hydrated_alcohol;
        caneReceived[newKey].lotnumber = _lotnumber;
        LogDistillation(msg.sender, _lotnumber, _anhydrous_alcohol, _hydrated_alcohol);
        
        return true;
        
    }

  }