window.addEventListener("message", function (evt) {
    if (evt.origin === 'https://www2.lgcgroup.com' && typeof evt.data === 'string') {
        var val = +evt.data;

        var $iframe = [].slice.call(document.getElementsByTagName('iframe')).filter(function (iframe) {
            return iframe.contentWindow === event.source;
        })[0];

        $iframe.style.height = val + 'px';
    }
}, false);

(function () {
    var timer = null;
    $(window).bind('resize.resizeEnd', function () {
        if (timer) {
            clearInterval(timer);
        }
        timer = setInterval(function () {
            clearInterval(timer);
            $(window).trigger('resizeEnd');
        }, 250);
    });
}());


function calculateImageProps(imageW, imageH, pathW, pathH, pathX, pathY) {
    var imageAspectRatio = imageW / imageH;
    var pathAspectRatio = pathW / pathH;
    var renderableHeight, renderableWidth, xStart, yStart;

    // If image's aspect ratio is less than canvas's we fit on width
    // and place the image centrally along height
    if (imageAspectRatio < pathAspectRatio) {
        renderableWidth = pathW;
        renderableHeight = imageH * (renderableWidth / imageW);
        xStart = pathX;
        yStart = pathY + (pathH - renderableHeight) / 2;
    }

    // If image's aspect ratio is greater than canvas's we fit on height
    // and place the image centrally along width
    else if (imageAspectRatio > pathAspectRatio) {
        renderableHeight = pathH;
        renderableWidth = imageW * (renderableHeight / imageH);
        xStart = pathX + (pathW - renderableWidth) / 2;
        yStart = pathY;
    }

    // keep aspect ratio
    else {
        renderableHeight = pathH;
        renderableWidth = pathW;
        xStart = pathX;
        yStart = pathY;
    }

    return {
        height: renderableHeight,
        width: renderableWidth,
        x: xStart,
        y: yStart
    }
}

var ctxArr = [];

var konvaFlag = true;

function createShapeCanvas() {
    var $containers = $('.js-hook__konva');

    if ($containers.length) {
        var url = '{{ get_public_template_url("/Templates/Custom/Page/assets/konva.js") }}';

        var shapesConfig = [
            // 0
            {
                canvasWidth: 288,
                canvasHeight: 216,
                imageInFirstLayer: true,
                isFirstLayerOverlay: true,
                isGradient: true,

                firstPathData: 'M89,0c54-0.5,134.4,60.2,119.4,106.7c-14.9,45.2-54.7,62.1-95.6,62.5C57.6,169.8,0.3,140,0,108.7\n' +
                '\tC-0.3,72.7,33.3,25,63.1,6.7C70.4,2.2,79.3,0.1,89,0',
                firstPathX: 0,
                firstPathY: 13,
                firstPathColor: '#027089',

                secondPathData: 'M135.2,0c41.2,0.2-18.8,50.4,25.2,103.7C197.2,148.3,87.1,207,46,206.9c-41.2-0.2,12.5-68.2-34.6-103.8\n' +
                '\tC-39.4,64.7,94-0.2,135.2,0',
                secondPathX: 120,
                secondPathY: 0,
                secondPathColor: '#67C8C7',

                gradientStartX: 0,
                gradientEndX: 167.8067,
                gradientStartY: 103.4351,
                gradientEndY: 103.4351
            },
            // 1
            {
                canvasWidth: 260,
                canvasHeight: 231,
                imageInFirstLayer: false,
                isFirstLayerOverlay: false,
                isGradient: true,

                firstPathData: 'M94.6,150.1c-26.7,20.3-14.6-28.6-63.8-37.8c-69.6-13.1-3.2-38.7,23.5-59.1C81,32.8,61-25.1,109.5,12.3\n' +
                '\tC150.8,44.2,121.3,129.8,94.6,150.1',
                firstPathX: 0,
                firstPathY: 50,
                firstPathColor: '#027089',

                secondPathData: 'M0,141.2c0-17.9,7.6-40.7,24.4-66.8c26.2-40.6,156.3-141.3,156.3-6.8c0,15.8-1.8,34.8-5.7,57.5\n' +
                '\tc-9.8,56.6-68.7,146-101.7,85.8c-29.3-53.4-41.3-9.5-66-44.2C2.5,160.2,0,151.5,0,141.2',
                secondPathX: 80,
                secondPathY: 0,
                secondPathColor: '#67C8C7',

                gradientStartX: 0,
                gradientEndX: 180.784,
                gradientStartY: 115.5,
                gradientEndY: 115.5
            },
            // 2
            {
                canvasWidth: 288,
                canvasHeight: 197,
                imageInFirstLayer: false,
                isFirstLayerOverlay: false,
                isGradient: true,

                firstPathData: 'M72.4,164.7c-37.3,9.6-1.3-37-47.6-69c-65.5-45.3,15.3-42.6,52.6-52.2C114.7,34,121.9-36.7,154,25\n' +
                '\tC181.2,77.5,109.7,155.2,72.4,164.7',
                firstPathX: 0,
                firstPathY: 6,
                firstPathColor: '#F5A81C',

                secondPathData: 'M169.6,0c35.1-2.5,47.9,97.2,36.1,144.2c-9.2,35.7-30,50.7-55,52.5C89.5,201.2,3.1,126.5,0.1,82.6\n' +
                '\tC-0.7,72.1,5,68.3,14.3,67.7c7.9-0.6,18.3,1,29.9,2.5c11.5,1.5,24.1,2.9,36.1,2.1c17.3-1.2,33.5-7.2,43.9-24.6\n' +
                '\tC142,14.5,157.2,0.9,169.6,0',
                secondPathX: 75,
                secondPathY: 0,
                secondPathColor: '#67C8C7',

                gradientStartX: 0,
                gradientEndX: 160,
                gradientStartY: 83,
                gradientEndY: 83
            },
            // 3
            {
                canvasWidth: 287,
                canvasHeight: 216,
                imageInFirstLayer: false,
                isFirstLayerOverlay: false,
                isGradient: true,

                firstPathData: 'M92.3,0c56-0.5,139.4,61.9,123.8,109.7c-15.4,46.4-56.7,63.9-99.1,64.3C59.7,174.5,0.3,143.9,0,111.7\n' +
                '\tc-0.3-37,34.6-86,65.4-104.9C73,2.2,82.2,0.1,92.3,0',
                firstPathX: 0,
                firstPathY: 20,
                firstPathColor: '#00788A',

                secondPathData: 'M176,132.1c0,9.6-2.5,17.7-7.1,23.9c-24,32.4-35.7-8.6-64.2,41.3C72.5,253.6,15.2,170,5.6,117.1\n' +
                '\tC1.7,95.8,0,78.1,0,63.3c0-125.8,126.7-31.6,152.2,6.3C168.6,94,176,115.4,176,132.1',
                secondPathX: 110,
                secondPathY: 0,
                secondPathColor: '#67C8C7',

                gradientStartX: 0,
                gradientEndX: 210.2521,
                gradientStartY: 84.6309,
                gradientEndY: 84.6309
            },
            // 4
            {
                canvasWidth: 287,
                canvasHeight: 208,
                imageInFirstLayer: true,
                isFirstLayerOverlay: true,
                isGradient: true,

                firstPathData: 'M38.1,1.5c15.1-4,37.3,0,66,14.3c44.7,22.3,181.4,155.8,67.9,186.1c-13.3,3.6-30.1,5.7-50.8,6.1\n' +
                '\tC69.5,208.9-29.3,158.4,8.3,105.2C41.7,58,0,53.4,19.4,16C23.1,8.8,29.4,3.8,38.1,1.5',
                firstPathX: 0,
                firstPathY: 0,
                firstPathColor: '#00788A',

                secondPathData: 'M188.2,56.1c9.7,66.9-67.1,102.8-83.7,106.1C65.7,169.9,22,140.9,4,109.4c-25.1-44,75.5-20.3,66.9-75.8\n' +
                '\tc-7-45.1,82.2-45.1,109.8,1.5C184.4,41.3,187,48.3,188.2,56.1',
                secondPathX: 98,
                secondPathY: 0,
                secondPathColor: '#67C8C7',

                gradientStartX: 0,
                gradientEndX: 186.497,
                gradientStartY: 87.2627,
                gradientEndY: 87.2627
            },
            // 5
            {
                canvasWidth: 287,
                canvasHeight: 220,
                imageInFirstLayer: true,
                isFirstLayerOverlay: true,
                isGradient: true,

                firstPathData: 'M89,0c54-0.5,134.4,60.2,119.4,106.7c-14.9,45.2-54.7,62.1-95.6,62.5C57.6,169.8,0.3,140,0,108.7\n' +
                '\tC-0.3,72.7,33.3,25,63.1,6.7C70.4,2.2,79.3,0.1,89,0',
                firstPathX: 0,
                firstPathY: 39,
                firstPathColor: '#00788A',

                secondPathData: 'M131,99.7c0,20.1-67.5,23.4-98.4,14.8C9.1,107.9,0,95.5,0,81.2C0,46.2,54.3,0,83.9,0c7.1,0,9.3,3.4,9.3,8.7\n' +
                '\tc0,4.5-1.6,10.4-3.1,16.9c-1.6,6.5-3.1,13.6-3.1,20.5c0,9.9,3.2,19.3,14.4,25.9C122.6,83.5,131,92.6,131,99.7',
                secondPathX: 156,
                secondPathY: 0,
                secondPathColor: '#67C8C7',

                gradientStartX: 0,
                gradientEndX: 131,
                gradientStartY: 59.5,
                gradientEndY: 59.5
            },
            // 6
            {
                canvasWidth: 289,
                canvasHeight: 174,
                imageInFirstLayer: true,
                isFirstLayerOverlay: true,
                isGradient: true,

                firstPathData: 'M85.9,0c52.1-0.5,129.8,58.3,115.3,103.4c-14.3,43.8-52.8,60.2-92.3,60.6C55.6,164.5,0.3,135.6,0,105.3\n' +
                '\tc-0.3-34.8,32.2-81,60.9-98.8C68,2.1,76.5,0.1,85.9,0',
                firstPathX: 0,
                firstPathY: 10,
                firstPathColor: '#00788A',

                secondPathData: 'M157.7,80.1c-2.7,10.7-12.2,22.6-29.6,34.1C101,132.1-18,160.3,2.3,79.4C4.7,69.9,9,58.9,15.6,46.3\n' +
                '\tC32,14.7,92.5-24.5,109.8,19.9c15.3,39.4,31.5,16,46,42.9C158.5,68.1,159.2,73.9,157.7,80.1',
                secondPathX: 130,
                secondPathY: 0,
                secondPathColor: '#67C8C7',

                gradientStartX: 23.201,
                gradientEndX: 173.0827,
                gradientStartY: -98.3442,
                gradientEndY: -98.3442
            },
            // 7
            {
                canvasWidth: 227,
                canvasHeight: 156,
                imageInFirstLayer: false,
                isFirstLayerOverlay: false,
                isGradient: true,

                firstPathData: 'M71.1,112.2c-6.2-2.7-11.2-12.6-13.5-33.5c-1.8-11.1-8.8-17.2-17.5-20.9c-6-2.6-12.7-4.1-19-5.3\n' +
                '\tc-6.2-1.2-11.9-2.3-15.8-4c-4.7-2-6.8-5-4.3-10.5c10.6-22.9,70.5-47.6,101-34.3c12.5,5.4,20,17.1,17.4,37.8\n' +
                '\tC115.8,68.8,88.6,119.8,71.1,112.2',
                firstPathX: 0,
                firstPathY: 33,
                firstPathColor: '#00788A',

                secondPathData: 'M0.1,71.7c-2.6-34,64.4-106.6,97.7-52c14,22.9,50.2,1.2,62.3,28.3c0.9,1.9,1.4,4.2,1.6,6.8\n' +
                '\tc1.9,24.8-23.7,77.6-36.9,90.1c-21.2,20-50.3,11.5-59.7,2.3c-11.1-9.7-20-28.8-22.9-40.4c-4.8-19.2-29.6-1.1-40.8-29.5\n' +
                '\tC0.6,75.6,0.2,73.7,0.1,71.7',
                secondPathX: 64,
                secondPathY: 0,
                secondPathColor: '#67C8C7',

                gradientStartX: 0,
                gradientEndX: 120,
                gradientStartY: 56.5,
                gradientEndY: 56.5
            },
            // 8
            {
                canvasWidth: 688,
                canvasHeight: 440,
                imageInFirstLayer: true,
                isFirstLayerOverlay: true,
                isGradient: true,

                firstPathData: 'M164.1,431.8c-23.9-4.6-42.8-14.8-56.2-29.8c-69.2-77.5,38.2-87.9-72.5-185.3C-89.4,106.9,145.4-0.6,281.4,0\n' +
                '\tc54.7,0.3,99.7,4.3,136.4,11.4c312.9,60.3,19.1,341.5-87.3,389C262.2,430.9,205.6,439.8,164.1,431.8',
                firstPathX: 0,
                firstPathY: 0,
                firstPathColor: '#00788A',

                secondPathData: 'M66.4,251.3c-13.5-6.2-24.6-14.7-31.9-25.7C4.6,180.6-12.3,91,10.8,39.3C30.9-5.6,129.5-13,206.3,22.1\n' +
                '\tc56.8,25.9,101.6,75.1,93.8,149.5C291.7,247.9,141.3,285.5,66.4,251.3',
                secondPathX: 387,
                secondPathY: 158,
                secondPathColor: '#67C8C7',

                gradientStartX: 0,
                gradientEndX: 301,
                gradientStartY: 132,
                gradientEndY: 132
            },
            // 9 -- user photo
            {
                canvasWidth: 290,
                canvasHeight: 249,
                imageInFirstLayer: true,
                isFirstLayerOverlay: false,
                isGradient: true,

                firstPathData: 'M147.1,222c-65.5,0.7-163-79-144.9-140c18-59.3,66.3-81.5,115.9-82C185.2-0.7,254.6,38.4,255,79.5\n' +
                '\tc0.4,47.2-40.4,109.7-76.5,133.8C169.6,219.2,158.9,221.9,147.1,222',
                firstPathX: 0,
                firstPathY: 27,
                firstPathColor: '#00788A',

                secondPathData: 'M123.2,95.1c-3,5.2-6.8,9.4-11.1,13c-32.7,26.5-96.2,8.7-78.6-20.9C55.1,50.8-23.2,47,7,21.8\n' +
                '\tC28.6,3.8,67.8-7.4,93.2,5.6C104.2,11.2,148.8,51.1,123.2,95.1',
                secondPathX: 157,
                secondPathY: 1,
                secondPathColor: '#67C8C7',

                gradientStartX: 0,
                gradientEndX: 131,
                gradientStartY: 60.5,
                gradientEndY: 60.5,

                opacity: 0.8
            },
            // 10 -- user photo
            {
                canvasWidth: 290,
                canvasHeight: 249,
                imageInFirstLayer: false,
                isFirstLayerOverlay: true,
                isGradient: true,

                firstPathData: 'M7.7,20.5c2.6-4.2,5.9-7.7,9.5-10.5C44.5-11.3,94,4.5,78.5,28.5c-19.1,29.6,42.9,34,17.6,54.3\n' +
                '\tc-18,14.5-49.7,23.1-69.3,11.9C18.5,90-14.9,56.3,7.7,20.5',
                firstPathX: 0,
                firstPathY: 67,
                firstPathColor: '#00788A',

                secondPathData: 'M147.1,222c-65.5,0.7-163-79-144.9-140c18-59.3,66.3-81.5,115.9-82C185.2-0.7,254.6,38.4,255,79.5\n' +
                '\tc0.4,47.2-40.4,109.7-76.5,133.8C169.6,219.2,158.9,221.9,147.1,222',
                secondPathX: 25,
                secondPathY: 0,
                secondPathColor: '#67C8C7',

                gradientStartX: 0,
                gradientEndX: 104,
                gradientStartY: 50.5,
                gradientEndY: 50.5,

                opacity: 0.8
            },
            // 11 -- user photo
            {
                canvasWidth: 290,
                canvasHeight: 249,
                imageInFirstLayer: true,
                isFirstLayerOverlay: false,
                isGradient: true,

                firstPathData: 'M147.1,222c-65.5,0.7-163-79-144.9-140c18-59.3,66.3-81.5,115.9-82C185.2-0.7,254.6,38.4,255,79.5\n' +
                '\tc0.4,47.2-40.4,109.7-76.5,133.8C169.6,219.2,158.9,221.9,147.1,222',
                firstPathX: 0,
                firstPathY: 0,
                firstPathColor: '#00788A',

                secondPathData: 'M48.8,112.3c-4.5,0.9-8.9,0.9-13,0c-31.2-6.1-49.4-55.3-23.3-60.3c32.2-6.1-1.4-57,27.8-51.7\n' +
                '\tc20.9,3.7,45.7,22.1,49.4,45C91.3,55.2,87.4,104.6,48.8,112.3',
                secondPathX: 190,
                secondPathY: 63,
                secondPathColor: '#67C8C7',

                gradientStartX: 0,
                gradientEndX: 90,
                gradientStartY: 56.5,
                gradientEndY: 56.5,

                opacity: 0.8
            },
            // 12 - grey intro section
            {
                canvasWidth: 591,
                canvasHeight: 412,
                imageInFirstLayer: true,
                isFirstLayerOverlay: true,
                isGradient: true,

                firstPathData: 'M20.3,408.1c-1-1.6-2-3.2-2.9-4.7C5.2,383-0.1,358.4,0,331.5C0.8,182.1,172-37.8,300,5.5\n' +
                '\tc124.3,42.9,169.6,153.7,169,266.8c-0.3,47.7-8.7,95.8-22.8,139.5',
                firstPathX: 63,
                firstPathY: 2,
                firstPathColor: '#00788A',

                secondPathData: 'M590.1,392l-141.6,2.8L0,394.1c10.3-29.2,33.7-49.6,72.8-59.4c230.7-57.9-57.5-347.6,161-334.3\n' +
                '\tc125.7,7.7,278,72,356.7,168.6',
                secondPathX: 1,
                secondPathY: 20,
                secondPathColor: '#00788A',

                gradientStartX: 289.5468,
                gradientEndX: 298.671,
                gradientStartY: 25.7484,
                gradientEndY: 550
            },
            // 13
            {
                canvasWidth: 688,
                canvasHeight: 445,
                imageInFirstLayer: true,
                isFirstLayerOverlay: true,
                isGradient: true,

                firstPathData: 'M17,67.8C3.1,85.2-2.2,104.7,0.8,125.3c15.8,106.4,105.6,55.6,107.7,202.6c2.4,165.8,272.8,128.8,374.3,52.2\n' +
                '\tc40.8-30.8,71.1-59.4,92.5-86.1C757.5,66.5,290.9-15.5,169.4,2.4C91.4,13.9,41.2,37.7,17,67.8',
                firstPathX: 0,
                firstPathY: 0,
                firstPathColor: '#00788A',

                secondPathData: 'M59.8,247.1C1.3,195.7-26.7,53.1,34.1,17.5C93.5-16.7,152.6,3.3,196.9,42.3c59.9,52.6,92.8,139.7,63,173.6\n' +
                '\tc-34.2,39-116.3,57.8-165.9,48.9C81.9,262.7,70.3,256.4,59.8,247.1',
                secondPathX: 412,
                secondPathY: 178,
                secondPathColor: '#00788A',

                gradientStartX: 0,
                gradientEndX: 271.0875,
                gradientStartY: 133.5,
                gradientEndY: 133.5
            },
            // Single shapes
            // 14
            {
                canvasWidth: 172,
                canvasHeight: 214.5,
                isGradient: true,

                pathData: 'M60.2,4.9C68.7,1.5,77.2,0,85.6,0c63,0,116.3,86.7,67.2,105.8c-60.5,23.6,23.4,107.7-35.4,108.7\n' +
                '\tc-42.1,0.7-97.1-25.1-112.7-67.1C-2,129.4-12.2,34.1,60.2,4.9',
                pathX: 0,
                pathY: 0,

                gradientStartX: 0,
                gradientEndX: 172,
                gradientStartY: 107.2689,
                gradientEndY: 107.2689
            },
            // 15
            {
                canvasWidth: 189.9,
                canvasHeight: 195.4,
                isGradient: true,

                pathData: 'M189.9,113.1c0,41.9-84.6,125.3-118.5,55.4c-14.2-29.3-58.4-5.8-70.1-40.1C0.4,126.1,0,123.2,0,120\n' +
                '\tC0,89.4,34.6,26.8,51.2,12.5c26.5-22.8,59.7-9.8,69.8,2.3C133,27.7,141.7,51.9,144,66.4c3.8,24,34.4,3.9,44.9,39.7\n' +
                '\tC189.5,108.2,189.9,110.6,189.9,113.1',
                pathX: 0,
                pathY: 0,

                gradientStartX: 0,
                gradientEndX: 189.8509,
                gradientStartY: 97.7129,
                gradientEndY: 97.7129
            },
            // 16
            {
                canvasWidth: 186.5,
                canvasHeight: 174.5,
                isGradient: true,

                pathData: 'M186.5,106.7c0,7.8-2.6,14.3-7.5,19.3c-25.5,26.2-37.8-7-68.1,33.4c-34.1,45.5-94.8-22.1-105-64.8\n' +
                '\tC1.8,77.4,0,63.1,0,51.1c0-101.7,134.3-25.6,161.3,5.1C178.6,76,186.5,93.2,186.5,106.7',
                pathX: 0,
                pathY: 0,

                gradientStartX: 0,
                gradientEndX: 186.497,
                gradientStartY: 87.2627,
                gradientEndY: 87.2627
            },
            // 17
            {
                canvasWidth: 197.7,
                canvasHeight: 163.5,
                isGradient: true,

                pathData: 'M133.1,163.4C86.1,162.6-17.8,97,2.6,33.3c24.1-74.9,49.2-0.4,96.2,0.4c47,0.8,143.4-22.7,75.3,42.9\n' +
                '\tC126.1,123.1,180.1,164.3,133.1,163.4',
                pathX: 0,
                pathY: 0,

                gradientStartX: 0,
                gradientEndX: 197.7464,
                gradientStartY: 81.7271,
                gradientEndY: 81.7271
            },
            // 18
            {
                canvasWidth: 169.5,
                canvasHeight: 210.4,
                isGradient: true,

                pathData: 'M169.5,90c0,54-61.5,133.8-107.8,118.4C16.6,193.2,0,153.2,0,112.3C0,57,30.3,0,61.6,0c36,0,83.3,34.1,101.4,64\n' +
                '\tC167.5,71.4,169.5,80.3,169.5,90',
                pathX: 0,
                pathY: 0,

                gradientStartX: 0,
                gradientEndX: 169.4677,
                gradientStartY: 105.1854,
                gradientEndY: 105.1854
            },
            // 19
            {
                canvasWidth: 201.7,
                canvasHeight: 200.1,
                isGradient: true,

                pathData: 'M201.7,135.2c0,13-8.1,27.8-28.7,39.2c-57.4,31.8-173,39-173-6.9c0-4.6,1.1-9.7,3.6-15.4\n' +
                '\tc5.7-13.1,29-24.5,29-45.1c0-4.9-1.3-10.4-4.5-16.5C22,79,19.5,67.9,19.5,57.7C19.5,30.3,37.9,9.2,57.9,2c42.2-15.2,69,58,93.8,87\n' +
                '\tC167,107,185.2,99.5,197.5,120C200.2,124.4,201.7,129.6,201.7,135.2',
                pathX: 0,
                pathY: 0,

                gradientStartX: 0,
                gradientEndX: 201.6689,
                gradientStartY: 100.0387,
                gradientEndY: 100.0387
            },
            // 20
            {
                canvasWidth: 193.9,
                canvasHeight: 180.5,
                isGradient: true,

                pathData: 'M193.9,60.6c0,74.2-113.7,176.4-141.3,81.7C39.7,97.8,2.7,84.2,0,65.3c0-0.6,0-1.1,0-1.6\n' +
                '\tc0-37.5,38.3-13.3,61.2-23.8C68.4,36.8,116-0.1,139.8,0c18.1,0.1,49.5,11.7,53.7,53.7C193.8,56,193.9,58.3,193.9,60.6L193.9,60.6',
                pathX: 0,
                pathY: 0,

                gradientStartX: 0,
                gradientEndX: 193.8735,
                gradientStartY: 90.2457,
                gradientEndY: 90.2457
            },
            // 21
            {
                canvasWidth: 171.2,
                canvasHeight: 186.7,
                isGradient: true,

                pathData: 'M171.2,156.4c0,31.5-88.2,36.7-128.7,23.3C11.8,169.3,0,149.8,0,127.4C0,72.5,71,0,109.7,0\n' +
                '\tc9.3,0,12.2,5.3,12.2,13.7c0,7-2,16.3-4.1,26.5c-2,10.2-4.1,21.3-4.1,32.1c0,15.5,4.2,30.3,18.8,40.7\n' +
                '\tC160.3,130.9,171.2,145.3,171.2,156.4',
                pathX: 0,
                pathY: 0,

                gradientStartX: 0,
                gradientEndX: 171.2317,
                gradientStartY: 93.328,
                gradientEndY: 93.328
            },
            // 22
            {
                canvasWidth: 165.9,
                canvasHeight: 208.1,
                isGradient: true,

                pathData: 'M33.8,0C74.4,0.4,205,67.1,154.5,104.8c-46.9,34.9,5,103.7-35.6,103.3C78.3,207.7-29.3,147.5,7.6,103.4\n' +
                '\tC51.7,50.7-6.7-0.4,33.8,0',
                pathX: 0,
                pathY: 0,

                gradientStartX: 0,
                gradientEndX: 165.9242,
                gradientStartY: 104.0619,
                gradientEndY: 104.0619
            },

            // End of single

            // Double 23
            {
                canvasWidth: 593.616,
                canvasHeight: 463.323,
                imageInFirstLayer: false,
                isFirstLayerOverlay: false,
                isGradient: true,

                firstPathData: 'M278.3,29.4c36.4,84.5,3.1,322.9-126.9,337.7c-153,17.4-40.4-87.5-76.8-172C38.1,110.6-81.7-42.5,90.4,26\n' +
                '\tC212.1,74.4,241.9-55.1,278.3,29.4',
                firstPathX: 1.659,
                firstPathY: 30,
                firstPathColor: '#00788A',

                secondPathData: 'M265.1,0c19.3,0,35.5,6.5,48,18.7c65,63.3-17.3,94,82.9,169.1c112.9,84.7-54.9,235.5-161,260.8\n' +
                '\tc-42.7,10.1-78.3,14.7-108,14.7c-252.5,0-63.5-333.6,12.7-400.7C188.8,19.6,231.6,0,265.1,0',
                secondPathX: 161.694,
                secondPathY: 0,
                secondPathColor: '#67C8C7',

                gradientStartX: 0,
                gradientEndX: 433.5812,
                gradientStartY: 231.6613,
                gradientEndY: 231.6613
            },
            // 24
            {
                canvasWidth: 590.382,
                canvasHeight: 592,
                imageInFirstLayer: true,
                isFirstLayerOverlay: true,
                isGradient: true,

                firstPathData: 'M166.1,13.6C189.5,4.2,213,0,236.1,0c173.8,0,321,239.2,185.6,292.1c-166.9,65.2,64.7,297.2-97.7,299.9\n' +
                '\tc-116.1,1.9-268-69.2-311-185.2C-5.5,356.9-33.7,94,166.1,13.6',
                firstPathX: 1.837,
                firstPathY: 0,
                firstPathColor: '#00788A',

                secondPathData: 'M306.2,1.4c17.8,3.2,31.7,11.9,41.3,25.3c49.5,69.3-31.6,83.9,48.3,170c90.2,97-89.9,208.3-192.1,213.9\n' +
                '\tc-41.1,2.2-74.8,0.5-102.1-4.4c-233.2-42.1-3-318.6,78.5-367.9C232.5,6.7,275.3-4.2,306.2,1.4',
                secondPathX: 171.854,
                secondPathY: 40,
                secondPathColor: '#67C8C7',

                gradientStartX: 0,
                gradientEndX: 420.3654,
                gradientStartY: 205.7924,
                gradientEndY: 205.7924
            },
            // 25
            {
                canvasWidth: 592.441,
                canvasHeight: 373.388,
                imageInFirstLayer: false,
                isFirstLayerOverlay: false,
                isGradient: true,

                firstPathData: 'M21,14.1C40.2,1,72.8-3.8,118.7,3.2c71.5,11,318.2,139.8,173.8,238.6c-16.9,11.6-39.2,22.7-67.9,33.3\n' +
                '\tc-71.2,26.2-229.8,0.1-200.4-95.6C50.3,94.7-9.5,108.2,1.3,44.3C3.4,32,10,21.7,21,14.1',
                firstPathX: 1.418,
                firstPathY: 10,
                firstPathColor: '#00788A',

                secondPathData: 'M171.4,1.2c119.7-14.5,313.1,100.2,291.5,207.1c-21.7,103.9-105.9,151.4-196.5,162.4\n' +
                '\tC143.9,385.7,9.4,333.9,1,264.5c-9.7-79.7,53.2-193.8,114.6-242C130.7,10.7,149.9,3.9,171.4,1.2',
                secondPathX: 129.267,
                secondPathY: 0,
                secondPathColor: '#67C8C7',

                gradientStartX: 0,
                gradientEndX: 337.0425,
                gradientStartY: 142.3095,
                gradientEndY: 142.3095
            },
            // 26
            {
                canvasWidth: 591.516,
                canvasHeight: 577.529,
                imageInFirstLayer: true,
                isFirstLayerOverlay: true,
                isGradient: true,

                firstPathData: 'M180.5,0c221,0,525.6,338.7,243.4,420.8c-132.5,38.5-173,148.7-229.4,156.7c-1.7,0-3.3,0.1-4.9,0.1\n' +
                '\tc-111.6,0-39.6-114.1-70.9-182.2C109.5,373.9-0.2,232,0,161C0.2,107,34.8,13.6,160.1,1C166.8,0.3,173.6,0,180.5,0L180.5,0',
                firstPathX: 1.76,
                firstPathY: 0,
                firstPathColor: '#00788A',

                secondPathData: 'M191,0c13.7,0.1,25.2,4.9,34,13.6c45.7,45.4-13,66.6,57.6,120.7c79.5,61-40.8,166.8-116.3,183.9\n' +
                '\tc-30.4,6.9-55.7,9.9-76.8,9.6C-89.9,326,46.9,90.6,101.5,43.5C136.6,13.3,167.2-0.3,191,0',
                secondPathX: 284.638,
                secondPathY: 10,
                secondPathColor: '#67C8C7',

                gradientStartX: 0,
                gradientEndX: 308.6381,
                gradientStartY: 163.9691,
                gradientEndY: 163.9691
            },
            // 27 -- user photo first bottom
            {
                canvasWidth: 290,
                canvasHeight: 249,
                imageInFirstLayer: true,
                isFirstLayerOverlay: false,
                isGradient: true,

                firstPathData: 'M147.1,222c-65.5,0.7-163-79-144.9-140c18-59.3,66.3-81.5,115.9-82C185.2-0.7,254.6,38.4,255,79.5\n' +
                    '\tc0.4,47.2-40.4,109.7-76.5,133.8C169.6,219.2,158.9,221.9,147.1,222',
                firstPathX: 0,
                firstPathY: 0,
                firstPathColor: '#00788A',

                secondPathData: 'M123.2,95.1c-3,5.2-6.8,9.4-11.1,13c-32.7,26.5-96.2,8.7-78.6-20.9C55.1,50.8-23.2,47,7,21.8\n' +
                    '\tC28.6,3.8,67.8-7.4,93.2,5.6C104.2,11.2,148.8,51.1,123.2,95.1',
                secondPathX: 157,
                secondPathY: 125,
                secondPathColor: '#67C8C7',

                gradientStartX: 0,
                gradientEndX: 131,
                gradientStartY: 60.5,
                gradientEndY: 60.5,

                opacity: 0.8
            }
        ];


        function setupKonva() {
            if (typeof Konva === "object") {
                Konva.pixelRatio = 1;

                // Setup Canvases
                $containers.each(function (index, container) {
                    var typeNumber = +$(container).data('type');
                    var imgSrc = $(container).data('src');
                    var imgW = $(container).data('imgw');
                    var imgH = $(container).data('imgh');
                    var shapeColorData = $(container).data('shapecolor');
                    var tWidth = $(container).width();
                    var tHeight = 0;
                    var scale = 1;
                    var settings = shapesConfig[typeNumber];
                    var isSingleShape = $(container).hasClass('js-hook__konva-single');

                    tHeight = tWidth * settings.canvasHeight / settings.canvasWidth;
                    scale = tWidth / settings.canvasWidth;

                    // Create Stage
                    var ctx = new Konva.Stage({
                        container: container,
                        width:  tWidth,
                        height: tHeight
                    });

                    ctxArr.push(ctx);

                    if (isSingleShape) {
                        // Create Layer
                        var layer = new Konva.Layer();

                        // Setup Layer
                        ctx.add(layer);

                        // Setup Path
                        var path = new Konva.Path({
                            data: settings.pathData,
                            x: 0,
                            y: 0,
                            scaleX: scale,
                            scaleY: scale,
                            listening: false,
                            perfectDrawEnabled: false
                        });

                        layer.add(path);

                        // Set Gradient Color
                        var gradientStopColors;
                        switch (shapeColorData) {
                            case 'cerulean':
                                gradientStopColors = [0, '#00788A', 1, '#67C8C7'];
                                break;
                            case 'violet':
                                gradientStopColors = [0, '#6A2875', 1, '#DA5B72'];
                                break;
                            case 'orange':
                                gradientStopColors = [0, '#F26724', 1, '#F5A81C'];
                                break;
                            case 'green':
                                gradientStopColors = [0, '#76BC43', 1, '#C3D62E'];
                                break;
                            case 'cerulean-dark':
                                gradientStopColors = [0, '#00788A', 0.4395, '#00798B', 0.5978, '#007D8F',
                                    0.7106, '#008595', 0.8018, '#00909F', 0.88, '#009EAA', 0.9479, '#37B1B8',
                                    1, '#67C8C7'];
                                break;
                        }

                        path.setAttrs({
                            fillLinearGradientStartPoint: {
                                x: settings.gradientStartX,
                                y: settings.gradientStartY
                            },
                            fillLinearGradientEndPoint: {
                                x: settings.gradientEndX,
                                y: settings.gradientEndY
                            },
                            fillLinearGradientColorStops: gradientStopColors
                        });

                        // Init Path z-index
                        path.globalCompositeOperation('destination-over');

                        // Init layer
                        layer.batchDraw();

                    } else {
                        // Create Layer
                        var layer = new Konva.Layer();
                        var layerSecond = new Konva.Layer();

                        // Setup Layer
                        if (settings.isFirstLayerOverlay) {
                            ctx.add(layerSecond);
                            ctx.add(layer);
                        } else {
                            ctx.add(layer);
                            ctx.add(layerSecond);
                        }

                        // Setup First Path
                        var firstPath = new Konva.Path({
                            data: settings.firstPathData,
                            x: settings.firstPathX * scale,
                            y: settings.firstPathY * scale,
                            scaleX: scale,
                            scaleY: scale,
                            listening: false,
                            perfectDrawEnabled: false
                        });
                        layer.add(firstPath);

                        // Setup Second Path
                        var secondPath = new Konva.Path({
                            data: settings.secondPathData,
                            x: settings.secondPathX * scale,
                            y: settings.secondPathY * scale,
                            scaleX: scale,
                            scaleY: scale,
                            listening: false,
                            perfectDrawEnabled: false
                        });

                        layerSecond.add(secondPath);

                        // Set Gradient Color
                        var gradientStopColors;
                        switch (shapeColorData) {
                            case 'cerulean':
                                gradientStopColors = [0, '#00788A', 1, '#67C8C7'];
                                break;
                            case 'violet':
                                gradientStopColors = [0, '#6A2875', 1, '#DA5B72'];
                                break;
                            case 'orange':
                                gradientStopColors = [0, '#F26724', 1, '#F5A81C'];
                                break;
                            case 'green':
                                gradientStopColors = [0, '#76BC43', 1, '#C3D62E'];
                                break;
                            case 'cerulean-dark':
                                gradientStopColors = [0, '#00788A', 0.4395, '#00798B', 0.5978, '#007D8F',
                                    0.7106, '#008595', 0.8018, '#00909F', 0.88, '#009EAA', 0.9479, '#37B1B8',
                                    1, '#67C8C7'];
                                break;
                        }

                        // Fill non-image field with gradient
                        if (settings.isGradient) {
                            var pathToFillGradient = settings.imageInFirstLayer ? secondPath : firstPath;
                            var pathToFillColor = !settings.imageInFirstLayer ? secondPath : firstPath;
                            var fillColor = settings.imageInFirstLayer ? settings.firstPathColor : settings.secondPathColor;

                            pathToFillGradient.setAttrs({
                                fillLinearGradientStartPoint: {
                                    x: settings.gradientStartX * scale,
                                    y: settings.gradientStartY * scale
                                },
                                fillLinearGradientEndPoint: {
                                    x: settings.gradientEndX * scale,
                                    y: settings.gradientEndY * scale
                                },
                                fillLinearGradientColorStops: gradientStopColors
                            });

                            pathToFillColor.fill(fillColor);

                            if (settings.opacity) {
                                pathToFillGradient.opacity(settings.opacity);
                            }


                        } else {
                            firstPath.fill(settings.firstPathColor);
                            secondPath.fill(settings.secondPathColor);
                        }

                        // Setup Image
                        var calculatedImageProps = null;
                        if (settings.imageInFirstLayer) {
                            calculatedImageProps = calculateImageProps(
                                imgW, imgH,
                                firstPath.getClientRect().width,
                                firstPath.getClientRect().height,
                                firstPath.getClientRect().x,
                                firstPath.getClientRect().y
                            );
                        } else {
                            calculatedImageProps = calculateImageProps(
                                imgW, imgH,
                                secondPath.getClientRect().width,
                                secondPath.getClientRect().height,
                                secondPath.getClientRect().x,
                                secondPath.getClientRect().y
                            );
                        }

                        var imageObj = new Image();
                        imageObj.onload = function () {
                            var image = new Konva.Image({
                                x: calculatedImageProps.x,
                                y: calculatedImageProps.y,
                                image: imageObj,
                                width: calculatedImageProps.width,
                                height: calculatedImageProps.height,
                                listening: false,
                                perfectDrawEnabled: false
                            });
                            image.globalCompositeOperation('source-in');
                            settings.imageInFirstLayer ? layer.add(image) : layerSecond.add(image);
                            image.draw();
                        };

                        imageObj.src = imgSrc;

                        // Init Path z-index
                        firstPath.globalCompositeOperation('destination-over');
                        secondPath.globalCompositeOperation('destination-over');

                        // Init layers
                        layer.batchDraw();
                        layerSecond.batchDraw();
                    }
                });
            }
        }

        if (konvaFlag) {
            $.getScript(url, function () {
                setupKonva();
                konvaFlag = false;
            });
        } else {
            setupKonva();
        }
    }
}

function destroyCanvases() {
    for (var i = 0; i < ctxArr.length; i++) {
        ctxArr[i].destroy();
    }
}

createShapeCanvas();

// Abstract Popups
function disablePageScroll() {
    $('body').css('overflow', 'hidden');
}

function enablePageScroll() {
    $('body').css('overflow', 'auto');
}


(function () {
    function showPopup(popup) {
        popup.css({display: 'flex'}).animate({opacity: 1}, 300);
        disablePageScroll();
    }

    function closePopup(popup) {
        popup.fadeOut(300, function () {
            $(this).css({opacity: 0});
            enablePageScroll();
        });
    }

    $('.js-hook__abstract-popup-trigger').on('click', function (ev) {
        ev.preventDefault();
        ev.stopPropagation();

        showPopup($(this).next('.js-hook__abstract-popup'));
    });

    $('.js-hook__close-abstract-popup').on('click', function (ev) {
        ev.preventDefault();
        ev.stopPropagation();

        closePopup($(this).closest('.js-hook__abstract-popup'));
    });
}());

// MatchHeight
var matchHeightFlag = true;

function bindResponsiveMatchHeight() {
    var url = '{{ get_public_template_url("/Templates/Custom/Page/assets/matchHeight.js") }}';

    function setupMatchHeight() {
        if (typeof $.fn.matchHeight === 'function') {
            if ($(window).width() >= 768) {
                jQuery('.js-hook__mh-item-responsive').matchHeight({
                    byRow: false
                });
            } else {
                jQuery('.js-hook__mh-item-responsive').matchHeight({
                    remove: true
                });
            }
        }
    }

    if (matchHeightFlag) {
        $.getScript(url, function () {
            setupMatchHeight();
            matchHeightFlag = false;
        });
    } else {
        setupMatchHeight();
    }
}

bindResponsiveMatchHeight();

jQuery(document).ready(function ($) {
    var $banner = $('.js-hook__hero');

    if ($banner.length) {
        var width = $banner.data('width');
        var height = $banner.data('height');
        var aspectRatio = height / width;
        var calculatedHeight = 0;

        function processHeight() {
            if ($(window).width() >= 768 && $(window).width() <= 1400) {
                $banner.css('height', $(window).width() * aspectRatio + 'px');

            } else if ($(window).width() > 1400) {
                $banner.css('height', 1400 * aspectRatio + 'px');

            } else {
                $banner.css('height', 'auto');
            }
        }

        processHeight();
        $(window).on('resizeEnd', function () {
            processHeight();
        });
    }
});

$(window).on('resizeEnd', function () {
    destroyCanvases();
    createShapeCanvas();
    bindResponsiveMatchHeight();
});

// Smooth Anchor Scroll
(function () {
    $('a[href*=\\#]:not([href=\\#])').on('click', function () {
        if (location.pathname.replace(/^\//, '') === this.pathname.replace(/^\//, '')
            || location.hostname === this.hostname) {

            var target = $(this.hash);
            target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
            if (target.length) {
                var scrollOffset = 0;
                $('html,body').animate({
                    scrollTop: target.offset().top - scrollOffset
                }, 400);
                return false;
            }
        }
    });
}());