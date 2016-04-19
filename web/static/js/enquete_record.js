'use strict';

export default class EnqueteRecord
{
    vote(enquete_id)
    {
        var recordObj = $("vote-count-" + enquete_id);

        $.ajax({
            type: "GET",
            url: "/vote/" + enquete_id,
        })
        .done(data => {
            if (data.result === "success") {
                var count = $("#vote-count-" + enquete_id).text();
                count = parseInt(count);
                $("#vote-count-" + enquete_id).text(count + 1);
                $("#" + enquete_id).prop("disabled", true).text("投票済み");
            } else {
                alert("fail!");
            }
        })
        .fail(err => {
            document.write(err.responseText);
        });
    }
}
