'use strict';

import React from 'react';

export default class DetailDialog extends React.Component
{
    constructor(props)
    {
        super(props);

        this.state = {
            enquete: {
                title: null
            },
            already_has_data: false,
            setDialog: false,
        }
    }

    componentDidUpdate()
    {
        if (this.props.is_show && !this.state.setDialog) {
            var dialog = document.getElementById('detail-' + this.props.id);

            if (!dialog.showModal) {
                dialogPolyfill.registerDialog(dialog);
            }

            if (dialog.querySelector('.close') !== null) {
                dialog.showModal();

                dialog.querySelector('.close').addEventListener('click', function() {
                    dialog.close();
                });

                this.setState({
                    enquete: this.state.enquete,
                    already_has_data: this.state.already_has_data,
                    setDialog: true,
                })
            }
        }
    }

    _callEnqueteDataApi()
    {
        return new Promise((resolve, reject) => {
            $.ajax({
                url: '/current_enquete_list/detail/' + this.props.id,
                type: 'GET',
            })
            .done(data => {
                data = data.data;
                this.setState({
                    enquete: data.enquete,
                    already_has_data: true,
                });

                return resolve();
            })
            .fail(err => {
                return reject(err);
            });
        });
    }

    _renderDialog()
    {
        var dialog_id = "detail-" + this.props.id;
        if (this.state.already_has_data) {
            return (
                <dialog className="mdl-dialog" id={dialog_id}>
                    <h4 className="mdl-dialog__title">{this.state.enquete.title}</h4>
                    <div className="mdl-dialog__content">

                    </div>
                    <div className="mdl-dialog__actions">
                        <button type="button" className="mdl-button">回答する</button>
                        <button type="button" className="mdl-button close">閉じる</button>
                    </div>
                </dialog>
            );
        } else {
            this._callEnqueteDataApi()
            .then(() => {
                return (
                    <dialog className="mdl-dialog" id={dialog_id}>
                        <h4 className="mdl-dialog__title">{this.state.enquete.title}</h4>
                        <div className="mdl-dialog__content">

                        </div>
                        <div className="mdl-dialog__actions">
                            <button type="button" className="mdl-button">回答する</button>
                            <button type="button" className="mdl-button close">閉じる</button>
                        </div>
                    </dialog>
                );
            })
            .catch(err => {
                console.log(err);
            });
        }

        return <dialog className="mdl-dialog" id={dialog_id} />;
    }

    render()
    {
        if (this.props.is_show) {
            return this._renderDialog();
        } else {
            return <dialog/>;
        }
    }
}
