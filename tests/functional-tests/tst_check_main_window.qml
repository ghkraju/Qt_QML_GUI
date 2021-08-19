import QtQuick 2.0
import QtTest 1.0

import "../../sources/KeyGenerationForm.ui.qml"


TestCase {
    name: "generate_keys"

    function initTestCase() {
    }

    function cleanupTestCase() {
    }

    function test_generate_key()
    {
        Loader
        {
            source:"KeyGenerationForm.ui.qml";
        }
    }

}
