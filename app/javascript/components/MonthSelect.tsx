import * as React from "react";
import { Bar } from 'react-chartjs-2';

const { useState } = React;

type MonthSelectProps = {
  monthValues: string[],
  currentMonth: string,
  currentDates: string[],
  currentDistances: (number | null)[],
};

const MonthSelect: React.FC<MonthSelectProps> = ( { monthValues, currentMonth, currentDates, currentDistances } ) => {
  const [monthValue, setMonthValue] = useState<string>(currentMonth);
  const [distanceData, setDistanceData] = useState<(number | null)[]>(currentDistances)

  const data = {
    labels: currentDates,
    datasets: [
      {
        label: '走行距離(km)',
        data: distanceData,
        backgroundColor: 'rgb(75, 192, 192)',
      }
    ],
  };

  return (
    <>
      <select value={monthValue} onChange={(e) => setMonthValue(e.target.value)}>
      {monthValues.map((monthValue) => {
        return (
          <option key={monthValue} value={monthValue}>{monthValue}</option>
        );
      })}
    </select>
    <Bar
      data={data}
    />
  </>
  );
};

export default MonthSelect;
