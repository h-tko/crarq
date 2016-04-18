'use strict';

export default class EnqueteRecord
{
    vote(enquete_id)
    {
        $.ajax({
            type: "GET",
            url: "/vote/" + enquete_id,
        })
        .done(data => {
            if (data.result === "success") {
                alert("success");
            } else {
                alert("fail!");
            }
        })
        .fail(err => {
            document.write(err.responseText);
        });
    }
}

