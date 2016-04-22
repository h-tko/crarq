'use strict';

import React from 'react';
import DetailDialog from './DetailDialog';

export default class ShowDetailDialog extends React.Component
{
    constructor(props)
    {
        super(props);

        this.state = {
            is_show: false
        };
    }

    _clickShowDialog()
    {
        this.setState({is_show: true});
    }

    render()
    {
        return (
            <div>
                <a className="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" href="#" onClick={this._clickShowDialog.bind(this)}>このアンケートに答える</a>
                <DetailDialog id={this.props.id} is_show={this.state.is_show} />
            </div>
        );
    }
}
