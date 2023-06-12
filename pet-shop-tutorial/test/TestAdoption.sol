pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
    // テスト内容
    // １：あるペットID




    // ペットショップコントラクトのアドレス
    Adoption adoption = Adoption(DeployedAddresses.Adoption());

    // テストするペットID
    uint expectedPetId = 8;

    // オーナーのアドレス
    address expectedAdopter = address(this);



    // 作成したAdopt関数をテストする関数
    function testUserCanAdoptPet() public {
        uint returnedId = adoption.adopt(expectedPetId);

        // 統合が成り立たなければ assert
        Assert.equal(returnedId, expectedPetId, "Adoption of the expected pet should match what is returned.");
    }


    // ペットIDに紐づくコントラクトを取得
    function testGetAdopterAddressByPetId() public {
        address adopter = adoption.adopters(expectedPetId);

        Assert.equal(adopter, expectedAdopter, "Owner of the expected pet should be this contract");
    }


    // ペットIDに紐づく全ペットオーナーを検索
    function testGetAdopterAddressByPetIdInArray() public {
        // Store adopters in memory rather than contract's storage
        address[16] memory adopters = adoption.getAdopters();

        Assert.equal(adopters[expectedPetId], expectedAdopter, "Owner of the expected pet should be this contract");
    }



}
