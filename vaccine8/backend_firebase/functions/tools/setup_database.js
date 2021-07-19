// Add collections and their documents to the database
// Setup the data first manually
// To use your own name for the document, specify the id
// property (The id must be of type string).  Otherwise,
// the document name will be auto-generated

const _collectionsJson = {
    users: [{
            id: "8tAAn0ru0rboKLs19PqWx26MndK2",
            name: "Omar",
            photoUrl: "https://randomuser.me/api/portraits/thumb/men/75.jpg",
            address: "",
            email: "omar@any.com",
            isDr: false,
        },
        {
            id: "ZNgmtbS4zsXucboMMaWUfwNHfGX2",
            name: "abdalla",
            photoUrl: "https://randomuser.me/api/portraits/thumb/women/75.jpg",
            address: "",
            email: "abdalla@any.com",
            isDr: true,
        },
        {
            id: "LHG216ZbBqfw3DpCCtxregwTzjq1",
            name: "body",
            photoUrl: "https://randomuser.me/api/portraits/thumb/women/77.jpg",
            address: "",
            email: "body@any.com",
            isDr: false,
        },
        {
            id: "42SYVgtfpPTlbuO7lqnrCUDcogm2",
            name: "Omar ELtablawy",
            photoUrl: "https://graph.facebook.com/3300345116773177/picture",
            address: "",
            email: "omareltably@gmail.com",
            isDr: false,
        },
    ],
    centers: [{
            id: "1",
            name: "Sultanah Hajjah Kalsom",
            address: "Tanah Rata, 39000 Tanah Rata, Pahang, Malaysia",
            location: "https://www.google.com/maps/dir/24.5963682,46.660879/vaccine+centres+in+malaysia/@11.3574384,34.8234339,3z/data=!3m1!4b1!4m9!4m8!1m1!4e1!1m5!1m1!1s0x31ca5778b2a8a425:0x455a960931f81930!2m2!1d101.3912089!2d4.4667742",
            imgRoute: "assets/Sultanah_Hajjah_Kalsom_Hospital.PNG",
        },
        {
            id: "2",
            name: "Merdeka Tapah",
            address: "35000 Tapah, Perak, Malaysia",
            location: "https://www.google.com/maps/dir/3.1416318,101.6954442/vaccine+centres+in+malaysia/@3.644003,100.9254721,9z/data=!3m1!4b1!4m9!4m8!1m1!4e1!1m5!1m1!1s0x31cb0683dfa98897:0x65f1e983e1a0a19d!2m2!1d101.2564611!2d4.1976039",
            imgRoute: "assets/Dewan_Merdeka_Tapah.PNG",
        },
        {
            id: "3",
            name: "Slim River Hospital",
            address: "35800 Slim River, Perak, Malaysia",
            location: "https://www.google.com/maps/dir//vaccine+centres+in+malaysia/data=!4m6!4m5!1m1!4e2!1m2!1m1!1s0x31cb9ccf2325f211:0xeb92f7e578f00f07?sa=X&ved=2ahUKEwjn8vHOse7xAhUjA2MBHeHQAdcQ9RcwAHoECBEQBA",
            imgRoute: "assets/Slim_River_Hospital.PNG",
        },
        {
            id: "4",
            name: "Kuala Kubu Bharu",
            address: "Jalan Hospital, Pekan Kuala Kubu Bharu, 44000 Kuala Kubu Baru, Selangor, Malaysia",
            location: "https://www.google.com/maps/dir//vaccine+centres+in+malaysia/data=!4m6!4m5!1m1!4e2!1m2!1m1!1s0x31cc73a3c4f6050b:0xaeb5ab935df7ed05?sa=X&ved=2ahUKEwjn-63dse7xAhX3C2MBHeMzAKsQ9RcwAHoECAYQBA",
            imgRoute: "assets/Kuala_Kubu_Bharu_Hospital.PNG",
        },
        {
            id: "5",
            name: "Kuala Lipis Hospital",
            address: "27200 Kuala Lipis, Pahang, Malaysia",
            location: "https://www.google.com/maps/dir/3.1416318,101.6954442/vaccine+centres+in+malaysia/@3.6542174,101.3119729,9z/data=!3m1!4b1!4m9!4m8!1m1!4e1!1m5!1m1!1s0x31cbd63386a22705:0x45661bc9cf97a59f!2m2!1d102.0556135!2d4.1826046",
            imgRoute: "assets/Kuala_Lipis_Hospital.PNG",
        },
    ],
    appointments: [{
        id: "vnpOjnFRFWO9Jt3tJEK7",
        centerId: "Kuala Kubu Bharu",
        applicantId: "42SYVgtfpPTlbuO7lqnrCUDcogm2",
        type: "vaccine",
        day: "2021-07-22 00:00:00.000Z",
        symptoms: null,
        reply: null,
        approve: true,
        disapprove: false,
    }, ],
    // medicines: [{
    //         id: "RkD8AdMO6VhsaxF36RUj",
    //         appointmentId: "2",
    //         name: "panadol",
    //     },
    //     {
    //         id: "2",
    //         appointmentId: "2",
    //         name: "prophine",
    //     },
    // ],
};

const _firestore = require("../api/models/firebase/firebase_admin").firestore();

async function setupDatabase(_req, res, _next) {
    // Start adding the data to the database
    for (const collectionName in _collectionsJson) {
        const collectionData = _collectionsJson[collectionName];

        for (const documentData of collectionData) {
            if (documentData && documentData.id) {
                const documentId = documentData.id;

                // id will not be included in the database. it is used only to name the document
                delete documentData.id;

                const result = await _firestore
                    .collection(collectionName)
                    .doc(documentId)
                    .set(documentData);
                console.log({ documentId, result });
            } else {
                await _firestore.collection(collectionName).add(documentData);
                console.log("auto gen doc id");
            }
        }
    }

    res.send("Setting Up Database.... Done ");
}

module.exports = setupDatabase;