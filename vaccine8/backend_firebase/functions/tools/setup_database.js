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
            photoUrl: "assets/profile_picture.png",
            address: "",
            email: "body@any.com",
            isDr: false,
        },
    ],
    centers: [{
            id: "1",
            name: "Sultanah Hajjah Kalsom Hospital",
            address: "Tanah Rata, 39000 Tanah Rata, Pahang, Malaysia",
            imgRoute: "assets/Sultanah_Hajjah_Kalsom_Hospital.PNG",
        },
        {
            id: "2",
            name: "Dewan Merdeka Tapah",
            address: "35000 Tapah, Perak, Malaysia",
            imgRoute: "assets/Dewan_Merdeka_Tapah.PNG",
        },
        {
            id: "3",
            name: "Slim River Hospital",
            address: "35800 Slim River, Perak, Malaysia",
            imgRoute: "assets/Slim_River_Hospital.PNG",
        },
        {
            id: "4",
            name: "Kuala Kubu Bharu Hospital",
            address: "Jalan Hospital, Pekan Kuala Kubu Bharu, 44000 Kuala Kubu Baru, Selangor, Malaysia",
            imgRoute: "assets/Kuala_Kubu_Bharu_Hospital.PNG",
        },
        {
            id: "5",
            name: "Kuala Lipis Hospital",
            address: "27200 Kuala Lipis, Pahang, Malaysia",
            imgRoute: "assets/Kuala_Lipis_Hospital.PNG",
        },
    ],
    // appointments: [{
    //         id: "1",
    //         centerId: "perdana hospital",
    //         applicantId: "8tAAn0ru0rboKLs19PqWx26MndK2",
    //         type: "vaccine",
    //         day: "2021-07-05 09:00:00.000Z",
    //         symptoms: null,
    //         reply: null,
    //         approve: true,
    //         disapprove: true,
    //     },
    //     {
    //         id: "2",
    //         centerId: "perdana hospital",
    //         applicantId: "LHG216ZbBqfw3DpCCtxregwTzjq1",
    //         type: "vaccine",
    //         day: "2021-07-03 09:00:00.000Z",
    //         symptoms: "fever",
    //         reply: "u ca",
    //         approve: true,
    //         disapprove: true,
    //     },
    //     {
    //         id: "3",
    //         centerId: "perdana hospital",
    //         applicantId: "LHG216ZbBqfw3DpCCtxregwTzjq1",
    //         type: "pcr",
    //         day: "2021-07-12 00:00:00.000Z",
    //         symptoms: null,
    //         reply: null,
    //         approve: false,
    //         disapprove: true,
    //     },
    //     {
    //         id: "4",
    //         centerId: "perdana hospital",
    //         applicantId: "LHG216ZbBqfw3DpCCtxregwTzjq1",
    //         type: "pcr",
    //         day: "2021-07-11 00:00:00.000Z",
    //         symptoms: null,
    //         reply: null,
    //         approve: false,
    //         disapprove: true,
    //     },
    //     {
    //         id: "5",
    //         centerId: "perdana hospital",
    //         applicantId: "8tAAn0ru0rboKLs19PqWx26MndK2",
    //         type: "pcr",
    //         day: "2021-07-25 00:00:00.000Z",
    //         symptoms: null,
    //         reply: null,
    //         approve: true,
    //         disapprove: true,
    //     },
    // ],
    medicines: [{
            id: "1",
            appointmentId: "2",
            name: "panadol",
        },
        {
            id: "2",
            appointmentId: "2",
            name: "prophine",
        },
    ],
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