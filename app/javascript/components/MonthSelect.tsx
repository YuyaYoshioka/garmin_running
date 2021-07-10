import * as React from "react";

const { useState } = React;

type MonthSelectProps = {
  monthValues: string[],
  currentMonth: string,
};

const MonthSelect: React.FC<MonthSelectProps> = ( { monthValues, currentMonth } ) => {
  const [value, setValue] = useState<string>(currentMonth);

  return (
    <select value={value} onChange={(e) => setValue(e.target.value)}>
      {monthValues.map((monthValue) => {
        return (
          <option key={monthValue} value={monthValue}>{monthValue}</option>
        );
      })}
    </select>
  );
};

export default MonthSelect;
