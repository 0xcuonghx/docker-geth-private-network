function ApproveListing() {
    return "Approve"
}

function ApproveTx(req) {
    return "Reject"
}

function ApproveSignData(req) {
    if (req.address.toLowerCase() == "0xa8d1beb561e50a4998b91032ce4b79bc9179c9b4") {
        if (req.content_type == "application/x-clique-header") {
            return "Approve"
        }
    }

    return "Reject"
}
