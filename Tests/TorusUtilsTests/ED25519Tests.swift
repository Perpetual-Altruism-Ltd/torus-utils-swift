//
//  ED25519Tests.swift
//
//
//  Created by Eric McGary on 4/9/22.
//

import XCTest
@testable import TorusUtils

class ED25519Tests: XCTestCase {
    func testThatInvalidKeyThrows() throws {
        var thrownError: Error?

        XCTAssertThrowsError(try ED25519.getED25519Key(privateKey: "invalid")) {
            thrownError = $0
        }

        XCTAssertTrue(
            thrownError is TorusUtilError,
            "Unexpected error type: \(type(of: thrownError))"
        )

        // Verify that our error is equal to what we expect
        XCTAssertEqual(thrownError as? TorusUtilError, .invalidKeySize)
    }

    func testThatValidKeyReturnsEd25519KeyPair() throws {
        let keypair = try ED25519.getED25519Key(privateKey: "746869736b65797061697277696c6c67656e6572617465737563636573736675")

        XCTAssertEqual(keypair.pk, "3KzG2V7hN9ZcqxsNw1xYmjoGjkhAnPHaeA2a5gbjSq9ib8Du3v5DgE1nQCDT9gtNJwhsZYmt9qnVcn1TXfDXjwmE")
        XCTAssertEqual(keypair.sk, "J9e2xjw84srAeBRrxtM4mDAF3UskupFCecFjFvcXM4G")
    }
    
    func test_checksumAdress() {
        let address = "0x90f8bf6a479f320ead074411a4b0e7944ea8c9c1"
        XCTAssertEqual(address.toChecksumAddress(), "0x90F8bf6A479f320ead074411a4B0e7944Ea8c9C1")
    }
    
    func test_generateMetadata(){
        let msg = "getNonce"
        let privKey = "d9733fc1098151f3e3289673e7c69c4ed46cbbdbc13416560e14741524d2d51a"
       let tu = TorusUtils(nodePubKeys: ROPSTEN_CONSTANTS.nodePubKeys)
        do{
        try tu.generateParams(message: msg, privateKey: privKey)
        }
        catch{
         XCTFail()
        }
    }
}
