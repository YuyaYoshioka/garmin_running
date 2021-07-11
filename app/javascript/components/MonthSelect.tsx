import * as React from "react";
import { Bar } from 'react-chartjs-2';
import axios from 'axios';

const { useState, useMemo, useEffect, memo } = React;

type GraphData = {
  distance: number,
  postedAt: string,
}

type MonthSelectProps = {
  monthValues: string[],
  currentMonth: string,
};

type DataType = {
  labels: string[];
  datasets: {
      label: string;
      data: number[];
      backgroundColor: string;
  }[];
};

type BarGraphProps = {
  data: DataType,
}

const BarGraph: React.FC<BarGraphProps> = memo(({ data }) => {
  return (
    <Bar
      data={data}
    />
  );
})

const MonthSelect: React.FC<MonthSelectProps> = ( { monthValues, currentMonth } ) => {
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
    axios.get(`api/month_distance?month="${monthValue}"`)
      .then(res => {
        setGraphData(res.data.data.currentUserPostsPerMonth);
      })
  }, [monthValue]);

  return (
    <>
      <select value={monthValue} onChange={(e) => setMonthValue(e.target.value)}>
      {monthValues.map((monthValue) => {
        return (
          <option key={monthValue} value={monthValue}>{monthValue}</option>
        );
      })}
      </select>
      <BarGraph
        data={data}
      />
    </>
  );
};

export default MonthSelect;
