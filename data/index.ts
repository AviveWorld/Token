import path from 'path';
import fs from 'fs';

export const getTokenomics = () => {
  const data = fs.readFileSync(
    path.join(__dirname, './tokenomics.txt'),
    'utf-8',
  );
  const lines = data.split('\n');

  const list: { time: number; date: string; amount: string }[] = [];

  // start from 1 to skip the header
  for (let i = 1; i < lines.length; i++) {
    const line = lines[i];
    const [
      date,
      avive_builder_amount,
      ecosystem_amount,
      partnership_development_comnunity_amount,
      comunity_amount,
      total,
    ] = line.split(/\s+/);
    list.push({
      time: new Date(date).getTime() / 1000,
      date,
      amount: total,
    });
  }

  return list;
};

if (require.main === module) {
  const list = getTokenomics();
  list.forEach((item, index) => {
    console.log(`// round ${index + 1} ${item.date}T00:00:00Z ${item.amount}`);
    console.log(`_releaseTimes[${index}] = ${item.time};`);
    console.log(
      `_releaseAmounts[${index}] = ${item.amount.replace(/,/g, '')} ether;`,
    );
  });
}
