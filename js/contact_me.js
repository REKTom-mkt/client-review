$(function () {
    $("#contactForm").find('textarea,input,select').jqBootstrapValidation({
        preventSubmit: !0,
        submitError: function (t, e, s) { },
        submitSuccess: function (t, e) {
            e.preventDefault(), e.stopPropagation();

            grecaptcha.execute('6LcWvP0rAAAAAMDobBzCI9RaW5MlDavOp2kHeYgn', { action: 'submit' }).then(function (token) {
                $("#token").val(token);

                $.ajax({
                    url: "/mail/contact_me.php",
                    type: "POST",
                    data: t.serialize(),
                    cache: !1,
                    success: function (res) {
                        const response = JSON.parse(res);
                        if (response.code == 200) {
							gtag('event', 'form_submit');
							gtag('event', 'conversion', {
								'send_to': 'AW-17827074108/ltelCMiZkd4bELygzrRC',
								'value': 10.0,
								'currency': 'USD'
							});
                            $("#success").html("<div class='alert alert-success alert-dismissible show'><span>Your message has been sent! </span><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>×</span></button></div>"),
                                $("#contactForm").trigger("reset");
                        } else {
                            $("#success").html("<div class='alert alert-danger alert-dismissible show'>Sorry, verification failed. Please try again later!<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>×</span></button></div>");
                        }
                    },
                    error: function () {
                        $("#success").html("<div class='alert alert-danger alert-dismissible show'>Sorry, it seems that my mail server is not responding. Please try again later!<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>×</span></button></div>");
                    },
                });
            });
        },
        filter: function () {
            return $(this).is(":visible");
        },
    });
});
