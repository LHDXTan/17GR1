package vvvv;

public class v {
	public static void main(String[] args) {
		int sum = 0;
		int num = 0;
		for (int i = 2; i < 10; i++) {
			for (int j = 2; j <i; j++) {
				if (i % j == 0) {
					break;
				}else{
					System.out.println(i);
					sum=sum+i;
					break;
				}

			}

		}
		System.out.println("1-10之间的所有素数和为：" + sum);
	}

}
