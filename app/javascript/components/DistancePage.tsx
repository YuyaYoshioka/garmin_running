import * as React from "react";
import axios from 'axios';
import { DataType, BarGraph } from 'components/BarGraph';
import { MonthSelectTag } from 'components/MonthSelectTag';

const { useState, useMemo, useEffect } = React;

type GraphData = {
  distance: number,
  postedAt: string,
}

type DistancePageProps = {
  monthValues: string[],
  currentMonth: string,
};

const DistancePage: React.FC<DistancePageProps> = ( { monthValues, currentMonth } ) => {
  const [monthValue, setMonthValue] = useState<string>(currentMonth);
  const [graphData, setGraphData] = useState<GraphData[]>([]);

  const data: DataType = useMemo(() => {
    return (
      {
        labels: graphData.map((data: GraphData) => data.postedAt),
        datasets: [
          {
            label: '走行距離(km)',
            data: graphData.map((data: GraphData) => data.distance),
            backgroundColor: 'rgb(75, 192, 192)',
          }
        ],
      });
  }, [graphData]);

  useEffect(() => {
    axios.get(`/api/month_distance?month="${monthValue}"`)
      .then(res => {
        setGraphData(res.data.data.currentUserPostsPerMonth);
      })
  }, [monthValue]);

  return (
    <>
      <MonthSelectTag
        monthValue={monthValue}
        monthValues={monthValues}
        handleChange={(value: string) => setMonthValue(value)}
      />
      <BarGraph
        data={data}
      />
    </>
  );
};

export default DistancePage;
