import { Grid2, Button } from '@mui/material';
import React, { useEffect, useState, useRef } from 'react';
import fetchData from '../utils/fetchDataUtils';
import { cardInfo } from '../widgets/QueryCardInfo';

export const ReportingQueryRunInfo = (props) => {
  const [data, setData] = useState([null, null, null]);
  const [loading, setLoading] = useState([false, false, false]);
  const [progress, setProgress] = useState([0, 0, 0]);

  const timeRef = useRef(null);

  // Helper function to handle refresh
  const handleRefresh = (queryNum) => {
    const fetchFunctions = [
      () => fetchData(setLoading, setProgress, setData, timeRef, "Reporting_Fetch"),
      () => fetchData(setLoading, setProgress, setData, timeRef, "Reporting1_Fetch"),
      () => fetchData(setLoading, setProgress, setData, timeRef, "Reporting2_Fetch"),
    ];
    
    fetchFunctions[queryNum - 1]();
  };

  useEffect(() => {
    // Initially fetch data when the component mounts or `props.refreshChilds` changes
    handleRefresh(1);
    handleRefresh(2);
    handleRefresh(3);
  }, [props.refreshChilds]);

  return (
    <>
      <Grid2 container spacing={1}>
        {[1, 2, 3].map((queryNum) => (
          <Grid2 size={4} key={`query-${queryNum}`}>
            <span style={{ padding: 50 }}>Query {queryNum}</span>
            <Button
              variant="outlined"
              style={{ color: '#44a6f7', border: '1px solid #141e4f', marginTop: '10px' }}
              onClick={() => handleRefresh(queryNum)}
            >
              Refresh
            </Button>
          </Grid2>
        ))}
      </Grid2>

      <Grid2 container spacing={1} mt={3}>
        {data.map((dataItem, index) => (
          <Grid2 size={4} key={`card-${index}`}>
            {cardInfo(dataItem, 1.37, loading[index], progress[index])}
          </Grid2>
        ))}
      </Grid2>
    </>
  );
};
