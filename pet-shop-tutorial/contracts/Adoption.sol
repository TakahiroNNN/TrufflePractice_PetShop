// solidityのバージョン指定
// ^0.5.0: solidity バージョン0.5.0 以上
pragma solidity ^0.5.0;

contract Adoption {
    // 大きさ16のaddress型配列を宣言
    address[16] public adopters;

    // int型のpetIdを受け取り int型を返す関数
    function adopt(uint petId) public returns (uint){
        // petIdが 0以上15以下（大きさの範疇）であるか確認
        require(petId >= 0 && petId <= 15);

        // 関数を呼び出したアドレス（msg.sender）をadopters配列に格納
        adopters[petId] = msg.sender;

        // 粋数として受け取った petId　を確認として返す
        return petId;
    }

    // adopters の getter
    // view: コントラクトの状態を変更しない（getter）
    function getAdopters() public view returns (address[16] memory){
        return adopters;
    }
}
