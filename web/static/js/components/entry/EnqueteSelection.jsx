'use strict';

import React from 'react';

export default class EnqueteSelection extends React.Component
{
    render()
    {
        return (
            <div key={this.props.id} className="mdl-grid">
                <div className="mdl-cell mdl-cell--12-col">
                    <div className="mdl-textfield mdl-js-textfield">
                        <input className="mdl-textfield__input" type="text" id={this.props.id} name="enquete[selection[]]"></input>
                        <label className="mdl-textfield__label" htmlFor={this.props.id}>選択肢を入力してください</label>
                    </div>
                </div>
            </div>
        );
    }
}
