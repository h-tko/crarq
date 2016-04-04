'use strict';

import React from 'react';

export default class EnqueteSelection extends React.Component
{
    _delete()
    {
        this.props.deleteObject(this.props.id);
    }

    render()
    {
        return (
            <div key={this.props.id} className="mdl-grid">
                <div className="mdl-cell mdl-cell--6-col">
                    <div className="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input className="mdl-textfield__input" type="text" id={this.props.id} name="enquete[selection][]"></input>
                        <label className="mdl-textfield__label" htmlFor={this.props.id}>選択肢を入力してください</label>
                    </div>
                </div>
                <div className="mdl-cell mdl-cell--3-col">
                    <button type="button" className="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" onClick={this._delete.bind(this)}>削除</button>
                </div>
            </div>
        );
    }
}
