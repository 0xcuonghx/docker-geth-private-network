function ApproveListing() {
    return "Approve"
}

function ApproveTx(req) {
    return "Reject"
}

function ApproveSignData(req) {
    if (req.address.toLowerCase() == "0xb96ce52cb8aa92cbe85dba75ecd4a04b12a4d972") {
        if (req.content_type == "application/x-clique-header") {
            return "Approve"
        }
    }

    return "Reject"
}
