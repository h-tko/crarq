'use strict';

import React from 'react';
import ReactDOM from 'react-dom';
import ShowDetailDialog from './ShowDetailDialog';

var show_details = document.querySelector('.show-detail');

if (Array.isArray(show_details)) {
    for (var idx in show_details) {
        ReactDOM.render(
            <ShowDetailDialog id={show_details[idx].getAttribute("key")} />,
            show_details[idx]
        );
    }
} else {
    ReactDOM.render(
        <ShowDetailDialog id={show_details.getAttribute("key")} />,
        show_details
    );
}
